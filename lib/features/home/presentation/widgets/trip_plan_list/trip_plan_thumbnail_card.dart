// 홈 화면) 여행 플랜 카드

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:plan_b/core/config/app_routes.dart';
import 'package:plan_b/core/theme/app_colors.dart';
import 'package:plan_b/core/theme/app_text_styles.dart';
import 'package:plan_b/shared/widgets/feedback/skeleton/skeleton_image.dart';
import 'package:plan_b/features/home/presentation/widgets/d_day_tag.dart';
import 'package:plan_b/shared/providers/selected_plan_id_provider.dart';

class TripPlanThumbnailCard extends ConsumerWidget {
  const TripPlanThumbnailCard({
    super.key,
    required this.planId,
    required this.thumbnail,
    required this.title,
    required this.period,
    required this.budget,
    this.daysLeft,
  });

  final String planId;           // 플랜 id
  final ImageProvider thumbnail; // 썸네일
  final String title;            // 플랜 제목
  final DateTimeRange period;    // 여행 기간
  final String budget;           // 예산 문구
  final int? daysLeft;           // null이면 디데이 태그 숨김 (지난 여행)

  static const double _radius = 12;

  static String _formatPeriod(DateTimeRange range) {
    String format(DateTime d) {
      final yy = (d.year % 100).toString().padLeft(2, '0');
      final mm = d.month.toString().padLeft(2, '0');
      final dd = d.day.toString().padLeft(2, '0');
      return '$yy.$mm.$dd';
    }

    return '${format(range.start)}-${format(range.end)}';
  }

  void _openPlanner(BuildContext context, WidgetRef ref) {
    ref.read(selectedPlanIdProvider.notifier).select(planId);
    context.go(AppRoutes.planner);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Semantics(
      button: true,
      label: title,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => _openPlanner(context, ref),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(_radius),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // 썸네일
              AspectRatio(
                aspectRatio: 163 / 134,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    SkeletonImage(image: thumbnail),
                    if (daysLeft != null)
                      Positioned(
                        left: 10,
                        top: 10,
                        child: DDayTag(daysLeft: daysLeft!),
                      ),
                  ],
                ),
              ),

              // 정보 영역
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: const BoxDecoration(
                  color: AppColors.white,
                  border: Border(top: BorderSide(color: AppColors.gray50)), // 상단 구분선 1px
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 제목
                    Text(
                      title,
                      style: AppTextStyles.bodySemiBold16.copyWith(color: AppColors.gray800),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 2),

                    // 기간
                    Text(
                      _formatPeriod(period),
                      style: AppTextStyles.captionRegular12.copyWith(color: AppColors.gray400),
                      maxLines: 1,
                    ),
                    const SizedBox(height: 8),

                    // 예산
                    Text(
                      budget,
                      style: AppTextStyles.captionSemiBold14.copyWith(color: AppColors.gray600),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}