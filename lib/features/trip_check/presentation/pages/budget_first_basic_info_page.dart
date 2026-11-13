// (맞춤 여행 체크) 지갑 기준 Step 2: 여행 기본 정보 입력 페이지
// - 진입 시 '내 지갑을 기준으로 선택했어요' 토스트 표시

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:plan_b/core/config/app_routes.dart';
import 'package:plan_b/features/trip_check/data/models/companion_type.dart';
import 'package:plan_b/features/trip_check/presentation/providers/trip_check_draft_provider.dart';
import 'package:plan_b/features/trip_check/presentation/widgets/day_picker/day_picker.dart';
import 'package:plan_b/features/trip_check/presentation/widgets/field_label.dart';
import 'package:plan_b/features/trip_check/presentation/widgets/people_count_field.dart';
import 'package:plan_b/features/trip_check/presentation/widgets/selection_chip.dart';
import 'package:plan_b/shared/widgets/app_page.dart';
import 'package:plan_b/shared/widgets/btn/cta.dart';
import 'package:plan_b/shared/widgets/feedback/toast.dart';
import 'package:plan_b/shared/widgets/header/title_header.dart';
import 'package:plan_b/shared/widgets/nav/top_app_bar.dart';

class BudgetFirstBasicInfoPage extends ConsumerStatefulWidget {
  const BudgetFirstBasicInfoPage({super.key});

  @override
  ConsumerState<BudgetFirstBasicInfoPage> createState() =>
      _BudgetFirstBasicInfoPageState();
}

class _BudgetFirstBasicInfoPageState
    extends ConsumerState<BudgetFirstBasicInfoPage> {
  static const double _contentTopGap = 47;  // title_header 바깥 경계 ~ 첫 입력 필드 간격
  static const double _fieldGap = 32;       // 입력 필드끼리 간격
  static const double _ctaBottomGap = 20;   // CTA ~ 하단 safe area 간격

  late final TextEditingController _peopleController;

  @override
  void initState() {
    super.initState();

    // 뒤로 갔다가 다시 들어와도 이전 입력값이 보이도록 provider 값으로 시작
    final peopleCount = ref.read(tripCheckDraftProvider).peopleCount;
    _peopleController = TextEditingController(text: peopleCount?.toString() ?? '');

    // 이전 화면에서 '다음'을 눌러 넘어왔을 때 선택한 기준 안내
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      showToast(context, text: '내 지갑을 기준으로 선택했어요');
    });
  }

  @override
  void dispose() {
    _peopleController.dispose();
    super.dispose();
  }

  void _onNext() {
    // 다음 화면까지 토스트가 따라가지 않도록 정리
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    context.push(AppRoutes.budgetFirstBudget);
  }

  @override
  Widget build(BuildContext context) {
    final draft = ref.watch(tripCheckDraftProvider);
    final notifier = ref.read(tripCheckDraftProvider.notifier);

    // 세 항목을 모두 채워야 다음으로 진행 가능
    final bool isComplete = draft.travelPeriod != null &&
        (draft.peopleCount ?? 0) > 0 &&
        draft.companionType != null;

    return AppPage(
      appBar: const TopAppBar(),
      header: const TitleHeader(
        title: '여행의 기본 정보를 알려주세요.',
        size: TitleHeaderSize.md,
        align: TitleHeaderAlign.center,
      ),
      // 입력 필드 바깥을 누르면 키보드 내림
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: _contentTopGap),

              // 여행 가능 시기
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                spacing: 6,
                children: [
                  const FieldLabel('여행 가능 시기'),
                  DayPicker(
                    initialRange: draft.travelPeriod,
                    onChanged: notifier.setTravelPeriod,
                  ),
                ],
              ),
              const SizedBox(height: _fieldGap),

              // 여행 인원
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const FieldLabel('여행 인원'),
                  PeopleCountField(
                    controller: _peopleController,
                    onChanged: notifier.setPeopleCount,
                  ),
                ],
              ),
              const SizedBox(height: _fieldGap),

              // 여행 구성원 유형 (하나만 선택, 선택된 칩을 다시 누르면 해제)
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                spacing: 16,
                children: [
                  const FieldLabel('여행 구성원 유형'),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      for (final type in CompanionType.values)
                        SelectionChip(
                          text: type.label,
                          isSelected: draft.companionType == type,
                          onChanged: (selected) =>
                              notifier.setCompanionType(selected ? type : null),
                        ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomCta: Padding(
        padding: const EdgeInsets.only(bottom: _ctaBottomGap),
        child: Cta(
          text: '다음',
          isActive: isComplete,
          onPressed: _onNext,
        ),
      ),
    );
  }
}