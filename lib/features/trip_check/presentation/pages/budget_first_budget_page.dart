// 맞춤 여행 체크) 지갑 기준 Step 3: 1인당 최대 예산 선택

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:plan_b/core/config/app_routes.dart';
import 'package:plan_b/features/trip_check/data/models/budget_range.dart';
import 'package:plan_b/features/trip_check/presentation/providers/trip_check_draft_provider.dart';
import 'package:plan_b/features/trip_check/presentation/widgets/selection_item.dart';
import 'package:plan_b/shared/widgets/app_page.dart';
import 'package:plan_b/shared/widgets/btn/cta.dart';
import 'package:plan_b/shared/widgets/header/title_header.dart';
import 'package:plan_b/shared/widgets/nav/top_app_bar.dart';

class BudgetFirstBudgetPage extends ConsumerWidget {
  const BudgetFirstBudgetPage({super.key});

  static const double _contentTopGap = 47; // title_header 바깥 경계 ~ 선택지 간격
  static const double _itemGap = 16;       // 선택지끼리 간격
  static const double _ctaBottomGap = 20;  // CTA ~ 하단 safe area 간격

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // maxBudget만 구독
    final selected = ref.watch(
      tripCheckDraftProvider.select((draft) => draft.maxBudget),
    );
    final notifier = ref.read(tripCheckDraftProvider.notifier);

    return AppPage(
      appBar: const TopAppBar(),
      header: const TitleHeader(
        title: '이 여행에 쓸 수 있는\n최대 금액은 얼마인가요?',
        subtitle: '1인당 예산 기준으로 입력',
        size: TitleHeaderSize.md,
        align: TitleHeaderAlign.center,
      ),
      // 작은 화면에서 선택지가 CTA에 가려지지 않도록 스크롤 허용
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: _contentTopGap),
            for (final (i, budget) in BudgetRange.values.indexed) ...[
              if (i > 0) const SizedBox(height: _itemGap),
              SelectionItem(
                budget: budget.label,
                caption: budget.caption,
                isSelected: selected == budget,
                onTap: () => notifier.setMaxBudget(budget),
              ),
            ],
          ],
        ),
      ),
      bottomCta: Padding(
        padding: const EdgeInsets.only(bottom: _ctaBottomGap),
        child: Cta(
          text: '다음',
          isActive: selected != null,
          onPressed: () => context.push(AppRoutes.budgetFirstDetails),
        ),
      ),
    );
  }
}