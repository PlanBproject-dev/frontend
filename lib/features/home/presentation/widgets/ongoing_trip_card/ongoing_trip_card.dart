// 홈 화면) 지금 진행중인 여행 카드
// - 카드 틀(배경, 테두리, ellipse, 타이틀)만 담당하고, 내용은 하위 위젯으로 구성함.

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:plan_b/core/theme/app_colors.dart';
import 'package:plan_b/core/theme/app_effects.dart';
import 'package:plan_b/core/theme/app_text_styles.dart';
import 'package:plan_b/features/home/presentation/widgets/ongoing_trip_card/ongoing_trip_actions.dart';
import 'package:plan_b/features/home/presentation/widgets/ongoing_trip_card/ongoing_trip_info.dart';

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

                // 콘텐츠 박스
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      OngoingTripInfo(
                        thumbnail: thumbnail,
                        daysLeft: daysLeft,
                        destination: destination,
                        tags: tags,
                      ),
                      OngoingTripActions(planId: planId),
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