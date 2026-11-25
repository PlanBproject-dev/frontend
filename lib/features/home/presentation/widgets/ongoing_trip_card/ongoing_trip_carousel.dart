// 홈 화면) 진행중인 여행 카드 캐러셀
// - 여행 기간이 겹치는 플랜이 여러 개일 수 있어서 진행중인 여행을 가로로 넘겨서 표시한다.
// - 정렬: 시작일이 빠른 순 (먼저 시작한 여행이 첫 장이 됨.)
// - 0개: 표시 안 함 / 1개: 카드만 / 2개 이상: 캐러셀 + 페이지 표시 인디케이터

import 'package:flutter/material.dart';

import 'package:plan_b/core/theme/app_colors.dart';
import 'package:plan_b/features/home/data/models/trip_plan_summary.dart';
import 'package:plan_b/features/home/data/models/trip_time_status.dart';
import 'package:plan_b/features/home/presentation/widgets/ongoing_trip_card/ongoing_trip_card.dart';

class OngoingTripCarousel extends StatefulWidget {
  const OngoingTripCarousel({
    super.key,
    required this.plans,
  });

  final List<TripPlanSummary> plans; // 전체 플랜 (진행중인 것만 골라서 표시)

  @override
  State<OngoingTripCarousel> createState() => _OngoingTripCarouselState();
}

class _OngoingTripCarouselState extends State<OngoingTripCarousel> {
  static const double _horizontalPadding = 24; // 화면 좌우 여백

  final PageController _controller = PageController();
  int _page = 0; // 현재 보고 있는 페이지

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildCard(TripPlanSummary plan) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: _horizontalPadding),
      child: OngoingTripCard(
        planId: plan.id,
        thumbnail: NetworkImage(plan.thumbnailUrl),
        daysLeft: plan.daysLeft,
        destination: plan.destination,
        tags: plan.tags,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ongoingPlans = widget.plans
        .where((plan) => plan.status == TripTimeStatus.ongoing)
        .toList()
      ..sort((a, b) => a.period.start.compareTo(b.period.start));

    // 0개: 표시 안 함
    if (ongoingPlans.isEmpty) return const SizedBox.shrink();

    // 1개: 넘길 필요 없으므로 카드만 표시.
    if (ongoingPlans.length == 1) return _buildCard(ongoingPlans.first);

    // 플랜 개수가 줄어든 경우 현재 페이지가 범위를 벗어나지 않도록
    final currentPage = _page.clamp(0, ongoingPlans.length - 1);

    return Column(
      children: [
        Stack(
          children: [
            // 높이 맞춤용 (보이지 않음): 가장 긴 카드 높이만큼 Stack 높이를 잡아 줌
            // PageView는 스스로 높이를 정하지 못해서, 카드 내용(해시태그 줄 수 등)에 따라
            // 높이가 달라져도 잘리지 않도록 이 방식을 사용
            for (final plan in ongoingPlans)
              Visibility(
                visible: false,
                maintainSize: true,
                maintainAnimation: true,
                maintainState: true,
                child: _buildCard(plan),
              ),

            // 실제로 보이는 캐러셀
            Positioned.fill(
              child: PageView.builder(
                controller: _controller,
                clipBehavior: Clip.none, // 카드 그림자가 잘리지 않도록
                itemCount: ongoingPlans.length,
                onPageChanged: (page) => setState(() => _page = page),
                itemBuilder: (context, index) => Align(
                  alignment: Alignment.topCenter,
                  child: _buildCard(ongoingPlans[index]),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),

        // 페이지 표시 인디케이터
        _PageIndicator(count: ongoingPlans.length, current: currentPage),
      ],
    );
  }
}

/// 페이지 표시 인디케이터 (현재 페이지는 길쭉한 파란 점)
class _PageIndicator extends StatelessWidget {
  const _PageIndicator({
    required this.count,
    required this.current,
  });

  final int count;
  final int current;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (var i = 0; i < count; i++) ...[
          if (i > 0) const SizedBox(width: 4),
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeOutCubic,
            width: i == current ? 16 : 6,
            height: 6,
            decoration: BoxDecoration(
              color: i == current ? AppColors.blue500 : AppColors.gray100,
              borderRadius: BorderRadius.circular(999),
            ),
          ),
        ],
      ],
    );
  }
}