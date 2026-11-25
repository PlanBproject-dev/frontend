import 'package:flutter/material.dart';

/// 월별 가이드 카드 전용 색상 (AppColors에 없는 값)
abstract final class MonthlyTodoCardPalette {
  /// 카드 배경 그라데이션
  static const Color gradientTop = Color(0xFF4D9DFF);
  static const Color gradientBottom = Color(0xFFECCDB7);

  static const LinearGradient background = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [gradientTop, gradientBottom],
  );

  /// 하단에서 내용을 흐리게 가리는 그라데이션 (스크롤 가능 표시용임)
  static const LinearGradient bottomFade = LinearGradient(
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
    colors: [gradientBottom, Color(0x00ECCDB7)],
    stops: [0.45, 1.0],
  );

  /// 바깥 테두리 (흰색 40%)
  static const Color frameBorder = Color(0x66FFFFFF);

  /// 안쪽 하이라이트 선 (흰색 60%)
  static const Color innerHighlight = Color(0x99FFFFFF);

  /// 안쪽 그림자 (검정 30%)
  static const Color innerShadow = Color(0x4D000000);
}