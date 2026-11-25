// 여행 코스 화면) 일일 코스 카드

import 'package:flutter/material.dart';

import 'package:plan_b/core/theme/app_colors.dart';
import 'package:plan_b/core/theme/app_effects.dart';
import 'package:plan_b/core/theme/app_text_styles.dart';
import 'package:plan_b/features/course/presentation/widgets/my_course_card/course_budget_tag.dart';
import 'package:plan_b/features/course/presentation/widgets/my_course_card/course_highlight_ellipse.dart';

/// 일일 코스 카드 상태
enum MyCourseCardType {
  normal,   // 기본 카드: 반투명 흰 배경
  added,    // 새로 추가된 코스: 하이라이트 + 파란 제목
  updated,  // 장소가 추가된 기존 코스: 하이라이트 (추가된 장소는 CourseListItem.isAdded로 강조)
}

class DailyCourseCard extends StatelessWidget {
  const DailyCourseCard({
    super.key,
    required this.title,
    required this.budget,
    required this.items,
    this.type = MyCourseCardType.normal,
  });

  final String title;
  final String budget;
  final List<Widget> items;
  final MyCourseCardType type;

  static const double _radius = 16;
  static const double _borderWidth = 3;
  static const double _paddingH = 24;
  static const double _paddingV = 16;
  static const double _newDotSize = 8;
  static const double _newDotInset = 17; // 테두리 안쪽 기준 위&오른쪽 거리

  bool get _isHighlighted => type != MyCourseCardType.normal;

  @override
  Widget build(BuildContext context) {
    // 하이라이트 카드는 테두리(3px) 안쪽부터 여백을 계산
    final double inset = _isHighlighted ? _borderWidth : 0;

    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: _isHighlighted ? AppColors.white : AppColors.white75,
        borderRadius: BorderRadius.circular(_radius),
        boxShadow: _isHighlighted ? AppEffects.boxShadowHighlight : null,
      ),
      // 테두리는 하이라이트 타원 위에 그려지도록 foreground로 적용
      foregroundDecoration: _isHighlighted
          ? BoxDecoration(
              border: Border.all(color: AppColors.blue50, width: _borderWidth),
              borderRadius: BorderRadius.circular(_radius),
            )
          : null,
      child: Stack(
        children: [
          if (_isHighlighted) const CourseHighlightEllipse(),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: _paddingH + inset,
              vertical: _paddingV + inset,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 12,
              children: [
                // 제목 (우측 상단 점과 겹치지 않도록 오른쪽 여백)
                Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Text(
                    title,
                    style: AppTextStyles.titleSemiBold16.copyWith(
                      color: type == MyCourseCardType.added
                          ? AppColors.blue500
                          : AppColors.gray800,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 8,
                  children: [
                    // 코스 장소 목록
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: items,
                    ),
                    CourseBudgetTag(text: budget, isHighlighted: _isHighlighted),
                  ],
                ),
              ],
            ),
          ),
          // 우측 상단 update 표시 점
          if (_isHighlighted)
            Positioned(
              top: _newDotInset + inset,
              right: _newDotInset + inset,
              child: Container(
                width: _newDotSize,
                height: _newDotSize,
                decoration: const BoxDecoration(
                  color: AppColors.blue400,
                  shape: BoxShape.circle,
                ),
              ),
            ),
        ],
      ),
    );
  }
}