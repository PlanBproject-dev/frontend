// 코스 정보 추출 화면) 추출된 코스 카드 목록

import 'package:flutter/material.dart';

import 'package:plan_b/features/course/data/models/extracted_course.dart';
import 'package:plan_b/features/course/presentation/widgets/extracted_course_card/extracted_course_card.dart';

class ExtractedCourseList extends StatelessWidget {
  const ExtractedCourseList({
    super.key,
    required this.courses,
    required this.disabledIds,
    required this.onAddPressed,
  });

  final List<ExtractedCourse> courses;
  final Set<String> disabledIds;                 // 추가 중&추가 완료된 코스 id
  final ValueChanged<ExtractedCourse> onAddPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: 16, // 카드 사이 간격
      children: [
        for (final course in courses)
          ExtractedCourseCard(
            key: ValueKey(course.id),
            course: course,
            onAddPressed: disabledIds.contains(course.id)
                ? null
                : () => onAddPressed(course),
          ),
      ],
    );
  }
}