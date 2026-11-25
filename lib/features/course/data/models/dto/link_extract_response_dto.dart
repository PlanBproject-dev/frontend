import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:plan_b/features/course/data/models/course_category.dart';
import 'package:plan_b/features/course/data/models/extracted_course.dart';

part 'link_extract_response_dto.freezed.dart';
part 'link_extract_response_dto.g.dart';

/// POST /api/v1/plans/confirm/{confirmedPlanId}/contents/extract
@freezed
class LinkExtractResponseDto with _$LinkExtractResponseDto {
  const factory LinkExtractResponseDto({
    String? extractId, // 이번 추출 결과 id (코스 추가 요청 때 같이 보냄)
    @Default([]) List<ExtractCandidateDto> candidates,
  }) = _LinkExtractResponseDto;

  factory LinkExtractResponseDto.fromJson(Map<String, dynamic> json) =>
      _$LinkExtractResponseDtoFromJson(json);
}

/// 추출된 코스 후보 1개
@freezed
class ExtractCandidateDto with _$ExtractCandidateDto {
  const factory ExtractCandidateDto({
    required int index,      // 추출 결과 안에서의 후보 번호 (코스 추가 요청 때 보냄)
    String? url,             // 후보를 찾은 원본 링크
    String? tag,             // TOUR | LODGING | FOOD | ACTIVITY | LANDMARK | ETC
    String? courseName,
    @Default([]) List<String> details,
    num? estimatedCost,
  }) = _ExtractCandidateDto;

  factory ExtractCandidateDto.fromJson(Map<String, dynamic> json) =>
      _$ExtractCandidateDtoFromJson(json);
}

// 서버 -> UI 모양 변환

extension LinkExtractResponseDtoMapper on LinkExtractResponseDto {
  List<ExtractedCourse> toExtractedCourses() => candidates
      .map((c) => c.toExtractedCourse(extractId ?? ''))
      .toList();
}

extension ExtractCandidateDtoMapper on ExtractCandidateDto {
  ExtractedCourse toExtractedCourse(String extractId) => ExtractedCourse(
        id: index.toString(),
        extractId: extractId,
        index: index,
        category: _category(tag),
        title: courseName ?? '',
        caption: details.join(' · '),
        sourceUrl: url ?? '',
        estimatedCost: estimatedCost?.toInt(), // 없으면 null (0과 구분: '비용 알 수 없음')
      );
}

/// 서버 tag -> 카테고리
CourseCategory _category(String? tag) => switch (tag) {
      'TOUR' => CourseCategory.tour,
      'LODGING' => CourseCategory.accommodation,
      'FOOD' => CourseCategory.food,
      'ACTIVITY' => CourseCategory.activity,
      'LANDMARK' => CourseCategory.landmark,
      _ => CourseCategory.etc,
    };