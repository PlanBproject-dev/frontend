// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_list_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CourseListResponseDtoImpl _$$CourseListResponseDtoImplFromJson(
  Map<String, dynamic> json,
) => _$CourseListResponseDtoImpl(
  courses:
      (json['courses'] as List<dynamic>?)
          ?.map((e) => CourseItemDto.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$$CourseListResponseDtoImplToJson(
  _$CourseListResponseDtoImpl instance,
) => <String, dynamic>{'courses': instance.courses};

_$CourseItemDtoImpl _$$CourseItemDtoImplFromJson(Map<String, dynamic> json) =>
    _$CourseItemDtoImpl(
      courseId: (json['courseId'] as num).toInt(),
      cost: json['cost'] as num?,
      courseType: json['courseType'] as String?,
      places:
          (json['places'] as List<dynamic>?)
              ?.map((e) => CoursePlaceDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$CourseItemDtoImplToJson(_$CourseItemDtoImpl instance) =>
    <String, dynamic>{
      'courseId': instance.courseId,
      'cost': instance.cost,
      'courseType': instance.courseType,
      'places': instance.places,
    };

_$CoursePlaceDtoImpl _$$CoursePlaceDtoImplFromJson(Map<String, dynamic> json) =>
    _$CoursePlaceDtoImpl(
      name: json['name'] as String?,
      description: json['description'] as String?,
      fromLink: json['fromLink'] as bool? ?? false,
    );

Map<String, dynamic> _$$CoursePlaceDtoImplToJson(
  _$CoursePlaceDtoImpl instance,
) => <String, dynamic>{
  'name': instance.name,
  'description': instance.description,
  'fromLink': instance.fromLink,
};
