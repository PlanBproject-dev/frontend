// trip_details_form.dart
// - 맞춤 여행 체크 세부 취향 입력 영역 (여행 스타일 / 숙소 유형 / 항공권 유형)
// - 지갑 기준, 목표 기준 details 페이지가 공통으로 사용함
// - 입력값은 tripCheckDraftProvider에 바로 저장한다

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:plan_b/features/trip_check/data/models/accommodation_type.dart';
import 'package:plan_b/features/trip_check/data/models/flight_preference.dart';
import 'package:plan_b/features/trip_check/data/models/travel_style.dart';
import 'package:plan_b/features/trip_check/data/models/trip_check_draft.dart';
import 'package:plan_b/features/trip_check/presentation/providers/trip_check_draft_provider.dart';
import 'package:plan_b/features/trip_check/presentation/widgets/field_label.dart';
import 'package:plan_b/features/trip_check/presentation/widgets/segmented_chip.dart';
import 'package:plan_b/features/trip_check/presentation/widgets/selection_chip.dart';
import 'package:plan_b/shared/widgets/feedback/toast.dart';

class TripDetailsForm extends ConsumerWidget {
  const TripDetailsForm({super.key});

  static const double _contentTopGap = 47;    // title_header 바깥 경계 ~ 첫 입력 필드 간격
  static const double _contentBottomGap = 45; // 마지막 입력 필드 ~ CTA 간격 (끝까지 스크롤했을 때)
  static const double _fieldGap = 40;         // 입력 필드끼리 간격
  static const double _labelGap = 16;         // 라벨 ~ 선택지 간격
  static const double _chipGap = 8;           // 칩끼리 간격 (가로/세로)
  static const double _segmentGap = 16;       // segmented_chip끼리 간격

  /// 스타일&숙소 1개 이상 + 항공권 항목 모두 선택해야 진행 가능 (페이지 CTA 활성 조건)
  static bool isComplete(TripCheckDraft draft) =>
      draft.travelStyles.isNotEmpty &&
      draft.accommodationTypes.isNotEmpty &&
      draft.flightPreferences.length == FlightPreference.values.length;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final draft = ref.watch(tripCheckDraftProvider);
    final notifier = ref.read(tripCheckDraftProvider.notifier);

    void showLimitToast(String text) =>
        showToast(context, text: text, type: ToastType.alert);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: _contentTopGap),

        // 나의 여행 스타일 (해시태그 칩, 최대 3개)
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: _labelGap,
          children: [
            const FieldLabel(
              '나의 여행 스타일',
              caption: '${TravelStyle.maxSelection}개까지만 선택',
            ),
            Wrap(
              spacing: _chipGap,
              runSpacing: _chipGap,
              children: [
                for (final style in TravelStyle.values)
                  SelectionChip(
                    text: style.label,
                    isHashtag: true,
                    isSelected: draft.travelStyles.contains(style),
                    onChanged: (_) {
                      if (!notifier.toggleTravelStyle(style)) {
                        showLimitToast(
                          '여행 스타일은 ${TravelStyle.maxSelection}개까지 선택할 수 있어요',
                        );
                      }
                    },
                  ),
              ],
            ),
          ],
        ),
        const SizedBox(height: _fieldGap),

        // 선호하는 숙소 유형 (체크 칩, 최대 2개)
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: _labelGap,
          children: [
            const FieldLabel(
              '선호하는 숙소 유형',
              caption: '${AccommodationType.maxSelection}개까지만 선택',
            ),
            Wrap(
              spacing: _chipGap,
              runSpacing: _chipGap,
              children: [
                for (final type in AccommodationType.values)
                  SelectionChip(
                    text: type.label,
                    isSelected: draft.accommodationTypes.contains(type),
                    onChanged: (_) {
                      if (!notifier.toggleAccommodationType(type)) {
                        showLimitToast(
                          '숙소 유형은 ${AccommodationType.maxSelection}개까지 선택할 수 있어요',
                        );
                      }
                    },
                  ),
              ],
            ),
          ],
        ),
        const SizedBox(height: _fieldGap),

        // 선호하는 항공권 유형 (항목마다 왼쪽/오른쪽 중 하나)
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: _labelGap,
          children: [
            const FieldLabel('선호하는 항공권 유형'),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              spacing: _segmentGap,
              children: [
                for (final preference in FlightPreference.values)
                  SegmentedChip(
                    leftText: preference.leftLabel,
                    rightText: preference.rightLabel,
                    selected: draft.flightPreferences[preference],
                    onSelected: (side) =>
                        notifier.setFlightPreference(preference, side),
                  ),
              ],
            ),
          ],
        ),

        const SizedBox(height: _contentBottomGap),
      ],
    );
  }
}