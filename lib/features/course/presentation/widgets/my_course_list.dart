// 나의 여행 코스: 일일 코스 카드 목록

import 'package:flutter/material.dart';

import 'package:plan_b/features/course/data/models/daily_course.dart';
import 'package:plan_b/features/course/presentation/widgets/my_course_card/course_list_item.dart';
import 'package:plan_b/features/course/presentation/widgets/my_course_card/my_course_card.dart';

class MyCourseList extends StatelessWidget {
  const MyCourseList({super.key, required this.courses});

  final List<DailyCourse> courses; // 예상 비용 낮은 순으로 정렬된 목록

  static MyCourseCardType _typeOf(DailyCourse course) {
    if (course.isNew) return MyCourseCardType.added;
    if (course.places.any((place) => place.isAdded)) return MyCourseCardType.updated;
    return MyCourseCardType.normal;
  }

  @override
  Widget build(BuildContext context) {
    int courseNo = 0;    // 기존 코스 번호
    int newCourseNo = 0; // 새 코스 번호

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: 12, // 카드 사이 간격
      children: [
        for (final course in courses)
          DailyCourseCard(
            key: ValueKey(course.id),
            title: course.isNew
                ? '일일 코스 new ${++newCourseNo}'
                : '일일 코스 ${++courseNo}',
            budget: course.budgetLabel,
            type: _typeOf(course),
            items: [
              for (final (i, place) in course.places.indexed)
                CourseListItem(
                  title: place.title,
                  caption: place.caption,
                  isAdded: place.isAdded,
                  isSingle: course.places.length == 1,
                  position: CourseListItemPosition.of(i, course.places.length),
                ),
            ],
          ),
      ],
    );
  }
}