// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'link_extract_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LinkExtractResponseDtoImpl _$$LinkExtractResponseDtoImplFromJson(
  Map<String, dynamic> json,
) => _$LinkExtractResponseDtoImpl(
  extractId: json['extractId'] as String?,
  candidates:
      (json['candidates'] as List<dynamic>?)
          ?.map((e) => ExtractCandidateDto.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$$LinkExtractResponseDtoImplToJson(
  _$LinkExtractResponseDtoImpl instance,
) => <String, dynamic>{
  'extractId': instance.extractId,
  'candidates': instance.candidates,
};

_$ExtractCandidateDtoImpl _$$ExtractCandidateDtoImplFromJson(
  Map<String, dynamic> json,
) => _$ExtractCandidateDtoImpl(
  index: (json['index'] as num).toInt(),
  url: json['url'] as String?,
  tag: json['tag'] as String?,
  courseName: json['courseName'] as String?,
  details:
      (json['details'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  estimatedCost: json['estimatedCost'] as num?,
);

Map<String, dynamic> _$$ExtractCandidateDtoImplToJson(
  _$ExtractCandidateDtoImpl instance,
) => <String, dynamic>{
  'index': instance.index,
  'url': instance.url,
  'tag': instance.tag,
  'courseName': instance.courseName,
  'details': instance.details,
  'estimatedCost': instance.estimatedCost,
};
