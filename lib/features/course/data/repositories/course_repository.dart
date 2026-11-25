import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:plan_b/core/network/api_request.dart';
import 'package:plan_b/core/network/dio_provider.dart';
import 'package:plan_b/features/course/data/models/course_extraction_failure.dart';
import 'package:plan_b/features/course/data/models/daily_course.dart';
import 'package:plan_b/features/course/data/models/dto/course_list_response_dto.dart';
import 'package:plan_b/features/course/data/models/extracted_course.dart';
import 'package:plan_b/features/course/data/models/dto/link_extract_request_dto.dart';
import 'package:plan_b/features/course/data/models/dto/link_extract_response_dto.dart';
import 'package:plan_b/features/course/data/models/dto/link_course_save_request_dto.dart';

class CourseRepository {
  CourseRepository(this._dio);
  final Dio _dio;

  /// 나의 여행 코스 조회 (일일 코스 목록)
  Future<List<DailyCourse>> getMyCourses(int confirmedPlanId) {
    return apiRequest(
      () => _dio.get('/api/v1/plans/confirm/$confirmedPlanId/courses'),
      (data) => CourseListResponseDto.fromJson(data as Map<String, dynamic>)
          .toDailyCourses(),
    );
  }

  /// 추출 요청 응답 대기 시간
  /// AI가 링크 내용을 읽느라 다른 API보다 오래 걸려서 이 요청만 늘림 (기본 60초)
  static const Duration _extractReceiveTimeout = Duration(seconds: 120);

  /// 링크에서 추가할 수 있는 코스를 못 찾았을 때 서버 에러 코드 (400)
  static const String _noCourseFoundCode = 'CONTENT004';

  /// 서버 에러 메시지 (끝의 마침표 유무와 관계없이 찾도록 contains로 비교)
  static const String _noCourseFoundMessage = '링크에서 추가할 수 있는 코스를 찾지 못했습니다';
  static const String _unsupportedLinkMessage = '인스타그램, 네이버, 티스토리, 유튜브 링크만 지원합니다';

  /// 링크에서 여행 코스 후보 추출 (AI가 링크 내용을 읽고 플랜 예산에 맞는 코스 추출)
  /// 실패하면 사유를 담은 CourseExtractionException을 던짐
  Future<List<ExtractedCourse>> extractCourses(
    int confirmedPlanId,
    List<String> urls,
  ) async {
    try {
      return await apiRequest(
        () => _dio.post(
          '/api/v1/plans/confirm/$confirmedPlanId/contents/extract',
          data: LinkExtractRequestDto(urls: urls).toJson(),
          options: Options(receiveTimeout: _extractReceiveTimeout),
        ),
        (data) => LinkExtractResponseDto.fromJson(data as Map<String, dynamic>)
            .toExtractedCourses(),
      );
    } on ApiException catch (e) {
      throw CourseExtractionException(_failureOf(e));
    }
  }

  /// 서버 에러 > 추출 실패 사유
  static CourseExtractionFailure _failureOf(ApiException e) {
    if (e.code == _noCourseFoundCode ||
        e.message.contains(_noCourseFoundMessage)) {
      return CourseExtractionFailure.noCourseFound;
    }
    if (e.message.contains(_unsupportedLinkMessage)) {
      return CourseExtractionFailure.unsupportedLink;
    }
    return CourseExtractionFailure.unknown;
  }

  /// 링크에서 고른 코스 후보를 나의 여행 코스로 추가
  /// 응답 data가 없으므로 성공 여부만 확인 (실패하면 ApiException)
  Future<void> addLinkedCourses(
    int confirmedPlanId, {
    required String extractId,
    required List<int> indexes,
  }) {
    return apiRequest(
      () => _dio.post(
        '/api/v1/plans/confirm/$confirmedPlanId/courses',
        data: LinkCourseSaveRequestDto(
          extractId: extractId,
          indexes: indexes,
        ).toJson(),
      ),
      (_) {},
    );
  }
}

final courseRepositoryProvider =
    Provider((ref) => CourseRepository(ref.read(dioProvider)));