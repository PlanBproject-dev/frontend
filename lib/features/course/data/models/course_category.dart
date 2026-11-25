import 'package:json_annotation/json_annotation.dart';

/// 추출된 코스의 카테고리
@JsonEnum(fieldRename: FieldRename.screamingSnake)
enum CourseCategory {
  tour('투어'),
  accommodation('숙소'),
  food('음식'),
  activity('액티비티'),
  landmark('랜드마크'),
  etc('기타');

  const CourseCategory(this.label);

  final String label; // 화면에 보여줄 한글 이름
}