import 'package:flutter/material.dart';

import 'package:plan_b/core/theme/app_colors.dart';
import 'package:plan_b/core/theme/app_text_styles.dart';
import 'package:plan_b/features/course/presentation/widgets/my_course_card/course_timeline_indicator.dart';

/// 일일 코스 카드 안에서 이 항목의 위치
enum CourseListItemPosition {
  first,
  between,
  last;

  /// 리스트 index와 전체 개수로 위치 계산
  static CourseListItemPosition of(int index, int length) {
    if (index == 0) return first;
    if (index == length - 1) return last;
    return between;
  }
}

/// 일일 코스 카드의 장소 항목 한 줄
class CourseListItem extends StatelessWidget {
  const CourseListItem({
    super.key,
    required this.title,
    required this.caption,
    this.position = CourseListItemPosition.first,
    this.isAdded = false,
    this.isSingle = true,
  });

  final String title;
  final String caption;
  final CourseListItemPosition position;
  final bool isAdded;
  final bool isSingle;

  static const double _radius = 8;
  static const double _indicatorTextGap = 10;
  static const double _titleLineHeight = 22;
  static const double _highlightTopPadding = 4;
  static const double _bottomPadding = 8;

  bool get _isFirst => position == CourseListItemPosition.first;
  bool get _isLast => position == CourseListItemPosition.last;

  @override
  Widget build(BuildContext context) {
    // 추가된 항목, between 항목은 텍스트 위에 4px만큼 여백을 두어야 함
    final double contentTop =
        (isAdded || position == CourseListItemPosition.between)
            ? _highlightTopPadding
            : 0;

    // 점을 제목 첫 줄의 세로 가운데에 맞춤
    final double dotTop = contentTop +
        (_titleLineHeight - CourseTimelineIndicator.dotSize) / 2;

    return DecoratedBox(
      decoration: isAdded
          ? const BoxDecoration(
              gradient: AppColors.surfaceGradientHighlight,
              borderRadius: BorderRadius.horizontal(
                right: Radius.circular(_radius),
              ),
            )
          : const BoxDecoration(),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: _indicatorTextGap,
          children: [
            CourseTimelineIndicator(
              dotTop: dotTop,
              showTopLine: !isSingle && !_isFirst,
              showBottomLine: !isSingle && !_isLast,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                  top: contentTop,
                  bottom: _bottomPadding,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 2,
                  children: [
                    Text(
                      title,
                      style: AppTextStyles.bodyMedium14.copyWith(
                        color: isAdded ? AppColors.blue500 : AppColors.gray800,
                      ),
                    ),
                    Text(
                      caption,
                      style: AppTextStyles.captionRegular12.copyWith(
                        color: AppColors.gray500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}