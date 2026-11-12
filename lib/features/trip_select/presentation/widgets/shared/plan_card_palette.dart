import 'package:flutter/material.dart';

import 'package:plan_b/core/theme/app_colors.dart';

/// 여행 플랜 카드(티켓·영수증)의 선택 여부에 따른 색상/에셋/간격 묶음
class PlanCardPalette {
  const PlanCardPalette._({
    required this.headerBg,
    required this.badgeBg,
    required this.badgeText,
    required this.country,
    required this.bodyBg,
    required this.tag,
    required this.stickerAsset,
    required this.summaryTitle,
    required this.summaryTitleBorder,
    required this.dashed,
    required this.dotAsset,
    required this.itemTitle,
    required this.itemLabel,
    required this.itemCost,
    required this.totalLabel,
    required this.totalValue,
    required this.summaryBoxBg,
    required this.summaryBoxText,
    required this.footerBg,
    required this.footerBorder,
    required this.footerText,
    required this.chevronAsset,
    required this.openContentSpacing,
  });

  // 헤더
  final Color headerBg;
  final Color badgeBg;
  final Color badgeText;
  final Color country;

  // 본문
  final Color bodyBg;
  final Color tag;
  final String stickerAsset;
  final Color summaryTitle;
  final Color summaryTitleBorder;
  final Color dashed;
  final String dotAsset;
  final Color itemTitle;
  final Color itemLabel;
  final Color itemCost;
  final Color totalLabel;
  final Color totalValue;
  final Color summaryBoxBg;
  final Color summaryBoxText;
  final double openContentSpacing;

  // 푸터
  final Color footerBg;
  final Color footerBorder;
  final Color footerText;
  final String chevronAsset;

  static PlanCardPalette of(bool selected) => selected ? _selected : _default;

  static const PlanCardPalette _default = PlanCardPalette._(
    headerBg: AppColors.bgSolidBasic,
    badgeBg: AppColors.gray50,
    badgeText: AppColors.gray500,
    country: AppColors.black,
    bodyBg: AppColors.white,
    tag: AppColors.gray500,
    stickerAsset: 'assets/graphics/graphic_price_sticker_md_gray.svg',
    summaryTitle: AppColors.gray800,
    summaryTitleBorder: AppColors.gray400,
    dashed: AppColors.gray200,
    dotAsset: 'assets/icons/ic_pin_8px_blue.svg',
    itemTitle: AppColors.gray800,
    itemLabel: AppColors.gray400,
    itemCost: AppColors.blue500,
    totalLabel: AppColors.gray800,
    totalValue: AppColors.blue600,
    summaryBoxBg: AppColors.bgSolidBasic,
    summaryBoxText: AppColors.gray600,
    openContentSpacing: 32,
    footerBg: AppColors.white,
    footerBorder: AppColors.gray200,
    footerText: AppColors.blue500,
    chevronAsset: 'assets/icons/ic_chevron_right_16px_blue.svg',
  );

  static const PlanCardPalette _selected = PlanCardPalette._(
    headerBg: AppColors.blue400,
    badgeBg: AppColors.blue500,
    badgeText: AppColors.blue100,
    country: AppColors.white,
    bodyBg: AppColors.blue500,
    tag: AppColors.blue100,
    stickerAsset: 'assets/graphics/graphic_price_sticker_md_blue.svg',
    summaryTitle: AppColors.white,
    summaryTitleBorder: AppColors.blue300,
    dashed: AppColors.blue200,
    dotAsset: 'assets/icons/ic_pin_8px_white.svg',
    itemTitle: AppColors.white,
    itemLabel: AppColors.blue200,
    itemCost: AppColors.white,
    totalLabel: AppColors.white,
    totalValue: AppColors.white,
    summaryBoxBg: AppColors.blue400,
    summaryBoxText: AppColors.blue50,
    openContentSpacing: 32,
    footerBg: AppColors.blue500,
    footerBorder: AppColors.blue300,
    footerText: AppColors.white,
    chevronAsset: 'assets/icons/ic_chevron_right_16px_white.svg',
  );
}