// 코스 추가 화면) 웹 링크에서 추출한 코스 정보 카드

import 'package:flutter/material.dart';

import 'package:plan_b/core/theme/app_colors.dart';
import 'package:plan_b/core/theme/app_text_styles.dart';
import 'package:plan_b/features/course/data/models/extracted_course.dart';
import 'package:plan_b/features/course/presentation/widgets/extracted_course_card/btn_course_add.dart';
import 'package:plan_b/features/course/presentation/widgets/extracted_course_card/course_category_tag.dart';
import 'package:plan_b/features/course/presentation/widgets/extracted_course_card/course_source_link.dart';

class ExtractedCourseCard extends StatelessWidget {
  const ExtractedCourseCard({
    super.key,
    required this.course,
    required this.onAddPressed,
  });

  final ExtractedCourse course;
  final VoidCallback? onAddPressed; // '+' 버튼: 내 코스에 추가 (null이면 비활성)

  static const double _radius = 16;
  static const double _captionMaxWidth = 240;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 18, 22, 20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(_radius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16,
        children: [
          // 상단 (카테고리 태그 + 제목 + '+' 버튼)
          Row(
            spacing: 12,
            children: [
              Expanded(
                child: Row(
                  spacing: 6,
                  children: [
                    CourseCategoryTag(category: course.category),
                    Expanded(
                      child: Text(
                        course.title,
                        style: AppTextStyles.titleSemiBold18.copyWith(
                          color: AppColors.gray800,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              BtnCourseAdd(onPressed: onAddPressed),
            ],
          ),

          // 주요 장소 키워드 + 원본 출처
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: _captionMaxWidth),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 4,
              children: [
                Text(
                  course.caption,
                  style: AppTextStyles.bodyMedium14.copyWith(color: AppColors.gray600),
                ),
                CourseSourceLink(url: course.sourceUrl),
              ],
            ),
          ),

          // 하단 (예상 비용)
          Text(
            course.budgetLabel,
            style: AppTextStyles.labelSemiBold16.copyWith(color: AppColors.blue500),
            maxLines: 1,
          ),
        ],
      ),
    );
  }
}