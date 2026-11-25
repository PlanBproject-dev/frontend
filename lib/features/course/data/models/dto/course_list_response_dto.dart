import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:plan_b/features/course/data/models/daily_course.dart';

part 'course_list_response_dto.freezed.dart';
part 'course_list_response_dto.g.dart';

/// GET /api/v1/plans/confirm/{confirmedPlanId}/courses
@freezed
class CourseListResponseDto with _$CourseListResponseDto {
  const factory CourseListResponseDto({
    @Default([]) List<CourseItemDto> courses,
  }) = _CourseListResponseDto;

  factory CourseListResponseDto.fromJson(Map<String, dynamic> json) =>
      _$CourseListResponseDtoFromJson(json);
}

/// 일일 코스 1개
@freezed
class CourseItemDto with _$CourseItemDto {
  const factory CourseItemDto({
    required int courseId,
    num? cost,
    String? courseType, // BASIC: 플랜 생성 시 만든 코스 / LINK: 웹 링크로 새로 생긴 코스
    @Default([]) List<CoursePlaceDto> places,
  }) = _CourseItemDto;

  factory CourseItemDto.fromJson(Map<String, dynamic> json) =>
      _$CourseItemDtoFromJson(json);
}

/// 일일 코스 안의 장소 1개
@freezed
class CoursePlaceDto with _$CoursePlaceDto {
  const factory CoursePlaceDto({
    String? name,
    String? description,
    @Default(false) bool fromLink, // 웹 링크에서 추가된 장소인지
  }) = _CoursePlaceDto;

  factory CoursePlaceDto.fromJson(Map<String, dynamic> json) =>
      _$CoursePlaceDtoFromJson(json);
}

// 서버 -> UI 모양 변환

extension CourseListResponseDtoMapper on CourseListResponseDto {
  List<DailyCourse> toDailyCourses() =>
      courses.map((c) => c.toDailyCourse()).toList();
}

extension CourseItemDtoMapper on CourseItemDto {
  DailyCourse toDailyCourse() {
    final bool isLinkCourse = courseType == 'LINK';

    return DailyCourse(
      id: courseId.toString(),
      estimatedCost: cost?.toInt(), // 없으면 null (0과 구분: '비용 알 수 없음')
      isNew: isLinkCourse,
      places: places
          .map((p) => CoursePlace(
                title: p.name ?? '',
                caption: p.description ?? '',
                // 새 코스(LINK)는 카드 전체가 강조됨 & 장소 강조는 기존 코스(BASIC)에 추가된 장소만
                isAdded: !isLinkCourse && p.fromLink,
              ))
          .toList(),
    );
  }
}