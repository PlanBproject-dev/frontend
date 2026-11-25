// 홈 화면) 여행 플랜 카드 목록

import 'package:flutter/material.dart';

import 'package:plan_b/features/home/data/models/trip_plan_summary.dart';
import 'package:plan_b/features/home/data/models/trip_time_status.dart';
import 'package:plan_b/features/home/presentation/widgets/trip_plan_list/trip_plan_thumbnail_card.dart';

class TripPlanList extends StatelessWidget {
  const TripPlanList({
    super.key,
    required this.plans,
  });

  final List<TripPlanSummary> plans;

  static const int _columns = 2;
  static const double _spacing = 16;    // 카드 좌우 간격
  static const double _runSpacing = 16; // 카드 위아래 간격

  @override
  Widget build(BuildContext context) {
    // 진행중인 여행은 플랜 카드로 그리지 않음
    final visiblePlans =
        plans.where((plan) => plan.status != TripTimeStatus.ongoing).toList();

    return LayoutBuilder(
      builder: (context, constraints) {
        // 카드 너비 = (전체 너비 - 간격 합) / 열 개수
        final cardWidth =
            (constraints.maxWidth - _spacing * (_columns - 1)) / _columns;

        return Wrap(
          spacing: _spacing,
          runSpacing: _runSpacing,
          children: [
            for (final plan in visiblePlans)
              SizedBox(
                width: cardWidth,
                child: TripPlanThumbnailCard(
                  planId: plan.id,
                  thumbnail: NetworkImage(plan.thumbnailUrl),
                  title: plan.title,
                  period: plan.period,
                  budget: plan.budget,
                  // 다가오는 여행만 디데이 태그 표시
                  daysLeft: plan.status == TripTimeStatus.upcoming
                      ? plan.daysLeft
                      : null,
                ),
              ),
          ],
        );
      },
    );
  }
}