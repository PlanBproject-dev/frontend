// 진행중인 여행 카드) 하단 버튼 영역
// - 선택한 플랜 id를 저장한 뒤 해당 플랜의 세부 화면으로 이동한다.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:plan_b/core/config/app_routes.dart';
import 'package:plan_b/core/theme/app_colors.dart';
import 'package:plan_b/shared/providers/selected_plan_id_provider.dart';
import 'package:plan_b/shared/widgets/btn/btn_text_primary.dart';

class OngoingTripActions extends ConsumerWidget {
  const OngoingTripActions({super.key, required this.planId});

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
          // Flexible: 폭이 부족하면 두 버튼이 남은 폭을 나눠 쓰고, 버튼 안 텍스트는 말줄임 처리 (내용이 짧으면 기존처럼 내용 크기만큼만 차지해서 가운데 정렬 유지)
          Flexible(
            child: BtnTextPrimary(
              text: '여행 플랜 보기',
              size: BtnTextSize.sm,
              onPressed: () => _open(context, ref, AppRoutes.planner),
            ),
          ),
          const SizedBox(width: 32),
          Flexible(
            child: BtnTextPrimary(
              text: '여행 코스 보기',
              size: BtnTextSize.sm,
              onPressed: () => _open(context, ref, AppRoutes.course),
            ),
          ),
        ],
      ),
    );
  }
}