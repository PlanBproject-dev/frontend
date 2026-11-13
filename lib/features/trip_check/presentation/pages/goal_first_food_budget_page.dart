// (맞춤 여행 체크) 목표 기준 Step 4: 1인당 한 끼 식사 예산 선택

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import 'package:plan_b/core/config/app_routes.dart';
import 'package:plan_b/core/theme/app_colors.dart';
import 'package:plan_b/core/theme/app_text_styles.dart';
import 'package:plan_b/features/trip_check/data/models/meal_budget.dart';
import 'package:plan_b/features/trip_check/presentation/providers/trip_check_draft_provider.dart';
import 'package:plan_b/features/trip_check/presentation/widgets/selection_item.dart';
import 'package:plan_b/shared/widgets/app_page.dart';
import 'package:plan_b/shared/widgets/btn/cta.dart';
import 'package:plan_b/shared/widgets/feedback/tooltip_primary.dart';
import 'package:plan_b/shared/widgets/header/title_header.dart';
import 'package:plan_b/shared/widgets/nav/top_app_bar.dart';

class GoalFirstFoodBudgetPage extends ConsumerWidget {
  const GoalFirstFoodBudgetPage({super.key});

  static const double _contentTopGap = 47; // title_header 바깥 경계 ~ '식사 금액을 입력하는 이유' 간격
  static const double _helpGap = 16;       // '식사 금액을 입력하는 이유' ~ 첫 선택지 간격
  static const double _itemGap = 12;       // 선택지끼리 간격
  static const double _ctaBottomGap = 20;  // CTA ~ 하단 safe area 간격

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(
      tripCheckDraftProvider.select((draft) => draft.mealBudget),
    );
    final notifier = ref.read(tripCheckDraftProvider.notifier);

    return AppPage(
      appBar: const TopAppBar(),
      header: const TitleHeader(
        title: '평소 여행에서 식사 한 끼에\n어느 정도 쓰시나요?',
        subtitle: '1인당 한 끼 기준으로 입력',
        size: TitleHeaderSize.md,
        align: TitleHeaderAlign.center,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: _contentTopGap),

            // 오른쪽 정렬된 안내 문구 + ? 아이콘 (탭하면 툴팁)
            Align(
              alignment: Alignment.centerRight,
              child: TooltipPrimary(
                message: '앞선 정보에 더해, 여행 예산 추천의\n정확도를 높이기 위한 참고 정보예요.',
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  spacing: 4,
                  children: [
                    Text(
                      '식사 금액을 입력하는 이유',
                      style: AppTextStyles.captionMedium14.copyWith(
                        color: AppColors.gray500,
                      ),
                    ),
                    // 툴팁 꼬리가 이 아이콘의 가운데를 가리킴
                    TooltipAnchor(
                      child: SvgPicture.asset(
                        'assets/icons/ic_question_16px.svg',
                        width: 16,
                        height: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: _helpGap),

            for (final (i, budget) in MealBudget.values.indexed) ...[
              if (i > 0) const SizedBox(height: _itemGap),
              SelectionItem(
                budget: budget.label,
                caption: budget.caption,
                isSelected: selected == budget,
                onTap: () => notifier.setMealBudget(budget),
              ),
            ],
          ],
        ),
      ),
      bottomCta: Padding(
        padding: const EdgeInsets.only(bottom: _ctaBottomGap),
        child: Cta(
          text: '나의 여행 정보 입력 완료!',
          isActive: selected != null,
          onPressed: () => context.push(AppRoutes.tripAnalysis),
        ),
      ),
    );
  }
}