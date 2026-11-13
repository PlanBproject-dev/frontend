// 홈 화면) 지금 진행중인 여행 카드

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:plan_b/core/config/app_routes.dart';
import 'package:plan_b/shared/providers/selected_plan_id_provider.dart';
import 'package:plan_b/core/theme/app_colors.dart';
import 'package:plan_b/core/theme/app_effects.dart';
import 'package:plan_b/core/theme/app_text_styles.dart';
import 'package:plan_b/features/home/presentation/widgets/d_day_tag.dart';
import 'package:plan_b/shared/widgets/btn/btn_text_primary.dart';

class OngoingTripCard extends StatelessWidget {
  const OngoingTripCard({
    super.key,
    required this.planId,
    required this.thumbnail,
    required this.daysLeft,
    required this.destination,
    required this.tags,
  });

  final String planId;             // 이 카드의 여행 플랜 id
  final ImageProvider thumbnail;   // 여행지 썸네일
  final int daysLeft;              // 디데이 태그용
  final String destination;        // 여행지
  final List<String> tags;         // 해시태그

  static const double _radius = 16;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // 부모 너비를 꽉 채우도록
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        gradient: AppColors.bgGradientTop,
        borderRadius: BorderRadius.circular(_radius),
        boxShadow: AppEffects.boxShadowLg,
      ),
      // 흰색 테두리는 ellipse 위에 그려져야 해서 foregroundDecoration으로 적용함
      foregroundDecoration: BoxDecoration(
        border: Border.all(color: AppColors.white, width: 2),
        borderRadius: BorderRadius.circular(_radius),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // 우측 상단 하이라이트 ellipse
          Positioned(
            left: 33,
            top: -203,
            width: 614,
            height: 401,
            child: IgnorePointer(
              child: SvgPicture.asset(
                'assets/backgrounds/bg_top_right_highlight_ellipse.svg',
                fit: BoxFit.fill,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // 타이틀
                Text(
                  '지금 진행중인 여행, 잘 즐기고 있나요?',
                  style: AppTextStyles.titleSemiBold16.copyWith(
                    color: AppColors.gray800,
                  ),
                ),
                const SizedBox(height: 12),

                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _TripInfo(
                        thumbnail: thumbnail,
                        daysLeft: daysLeft,
                        destination: destination,
                        tags: tags,
                      ),
                      _ActionButtons(planId: planId),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// 썸네일 + 디데이 태그 + 여행지 + 해시태그
class _TripInfo extends StatelessWidget {
  const _TripInfo({
    required this.thumbnail,
    required this.daysLeft,
    required this.destination,
    required this.tags,
  });

  final ImageProvider thumbnail;
  final int daysLeft;
  final String destination;
  final List<String> tags;

  @override
  Widget build(BuildContext context) {
    final tagStyle = AppTextStyles.labelMedium14.copyWith(color: AppColors.gray500);

    return ColoredBox(
      color: AppColors.white,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 썸네일
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image(
                image: thumbnail,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 디데이 태그 + 여행지
                  Row(
                    children: [
                      DDayTag(daysLeft: daysLeft),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          destination,
                          style: AppTextStyles.titleSemiBold18.copyWith(
                            color: AppColors.gray800,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),

                  // 해시태그 (넘치면 다음 줄로)
                  Wrap(
                    spacing: 4,
                    runSpacing: 2,
                    children: [
                      for (final tag in tags)
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('#', style: tagStyle),
                            const SizedBox(width: 2),
                            Text(tag, style: tagStyle),
                          ],
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// 하단 버튼 영역 : 선택한 플랜 id를 저장한 뒤 해당 화면으로 이동
class _ActionButtons extends ConsumerWidget {
  const _ActionButtons({required this.planId});

  final String planId;

  void _open(BuildContext context, WidgetRef ref, String route) {
    ref.read(selectedPlanIdProvider.notifier).select(planId);
    context.go(route);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: const BoxDecoration(
        color: AppColors.blue50,
        border: Border(top: BorderSide(color: AppColors.gray50)), // 상단 구분선 1px
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BtnTextPrimary(
            text: '여행 플랜 보기',
            size: BtnTextSize.sm,
            onPressed: () => _open(context, ref, AppRoutes.planner),
          ),
          const SizedBox(width: 32),
          BtnTextPrimary(
            text: '여행 코스 보기',
            size: BtnTextSize.sm,
            onPressed: () => _open(context, ref, AppRoutes.course),
          ),
        ],
      ),
    );
  }
}