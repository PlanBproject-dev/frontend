import 'package:flutter/material.dart';

import 'package:plan_b/core/theme/app_colors.dart';
import 'package:plan_b/features/trip_select/presentation/widgets/shared/plan_card_palette.dart';

/// 영수증 색상: 티켓과 같은 값은 PlanCardPalette를 그대로 쓰고, 다른 값만 추가
class ReceiptPalette {
  const ReceiptPalette._({
    required this.base,
    required this.totalLabel,
    required this.totalValue,
  });

  /// 본문 배경, 태그, 일정/숙소/항공, 요약박스, 푸터 등 티켓과 공통인 색상
  final PlanCardPalette base;

  /// 상단 '총 예상 비용 (인당)' 라벨 / 금액
  final Color totalLabel;
  final Color totalValue;

  /// 선택 시 btn_check 배경
  static const Color checkSelected = AppColors.blue700;

  /// 열림 상태에서 상단 영역 <-> 요약 박스 간격 (선택 여부 무관)
  static const double openContentSpacing = 32;

  static ReceiptPalette of(bool selected) => selected ? _selected : _default;

  static final ReceiptPalette _default = ReceiptPalette._(
    base: PlanCardPalette.of(false),
    totalLabel: AppColors.gray500,
    totalValue: AppColors.black,
  );

  static final ReceiptPalette _selected = ReceiptPalette._(
    base: PlanCardPalette.of(true),
    totalLabel: AppColors.blue100,
    totalValue: AppColors.white,
  );
}