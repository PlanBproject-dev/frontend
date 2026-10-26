// 텍스트 스타일: 폰트, 크기, 굵기, 행간, 자간 정의

import 'package:flutter/material.dart';

abstract final class AppTextStyles {
  /// font family
  static const String _fontFamily = 'Pretendard';

  /// Figma의 값을 그대로 넣으면 Flutter의 TextStyle로 변환해주는 보조 함수
  static TextStyle _figma({
    required FontWeight weight,
    required double size,
    required double lineHeight, // 단위: px
    double letterSpacingPercent = 0,   // 단위: %
  }) {
    return TextStyle(
      fontFamily: _fontFamily,
      fontWeight: weight,
      fontSize: size,
      // Figma의 line height(px): 폰트 크기에 대한 배수
      height: lineHeight / size,
      // Figma의 letterSpacing(%): 폰트 크기 기준으로 논리 픽셀을 계산하여 적용
      letterSpacing: size * letterSpacingPercent / 100,

      // 행간을 글자 위아래에 균등 배분 (Figma와 동일한 방식)
      leadingDistribution: TextLeadingDistribution.even,
    );
  }

  // Title
  static final TextStyle titleBold24 = _figma(
    weight: FontWeight.w700,
    size: 24,
    lineHeight: 34,
    letterSpacingPercent: -1,
  );

  static final TextStyle titleBold22 = _figma(
    weight: FontWeight.w700,
    size: 22,
    lineHeight: 32,
    letterSpacingPercent: -1,
  );

  static final TextStyle titleSemiBold22 = _figma(
    weight: FontWeight.w600,
    size: 22,
    lineHeight: 32,
    letterSpacingPercent: -1,
  );

  static final TextStyle titleSemiBold20 = _figma(
    weight: FontWeight.w600,
    size: 20,
    lineHeight: 28,
    letterSpacingPercent: -1,
  );

  static final TextStyle titleBold18 = _figma(
    weight: FontWeight.w700,
    size: 18,
    lineHeight: 24,
    letterSpacingPercent: -1,
  );

  static final TextStyle titleSemiBold18 = _figma(
    weight: FontWeight.w600,
    size: 18,
    lineHeight: 24,
    letterSpacingPercent: -1,
  );

  static final TextStyle titleMedium18 = _figma(
    weight: FontWeight.w500,
    size: 18,
    lineHeight: 24,
    letterSpacingPercent: -1,
  );

  static final TextStyle titleBold16 = _figma(
    weight: FontWeight.w700,
    size: 16,
    lineHeight: 24,
    letterSpacingPercent: -1,
  );

  static final TextStyle titleSemiBold16 = _figma(
    weight: FontWeight.w600,
    size: 16,
    lineHeight: 24,
    letterSpacingPercent: -1,
  );
  

  // Body

  static final TextStyle bodySemiBold16 = _figma(
    weight: FontWeight.w600,
    size: 16,
    lineHeight: 24,
    letterSpacingPercent: -1,
  );

  static final TextStyle bodyMedium16 = _figma(
    weight: FontWeight.w500,
    size: 16,
    lineHeight: 24,
    letterSpacingPercent: -1,
  );

  static final TextStyle bodyRegular16 = _figma(
    weight: FontWeight.w400,
    size: 16,
    lineHeight: 24,
    letterSpacingPercent: -1,
  );

  static final TextStyle bodySemiBold14 = _figma(
    weight: FontWeight.w600,
    size: 14,
    lineHeight: 22,
    letterSpacingPercent: -1,
  );  

  static final TextStyle bodyMedium14 = _figma(
    weight: FontWeight.w500,
    size: 14,
    lineHeight: 22,
    letterSpacingPercent: -1,
  );


  // Label

  static final TextStyle labelSemiBold16 = _figma(
    weight: FontWeight.w600,
    size: 16,
    lineHeight: 24,
    letterSpacingPercent: -1,
  );

  static final TextStyle labelMedium16 = _figma(
    weight: FontWeight.w500,
    size: 16,
    lineHeight: 24,
    letterSpacingPercent: -1,
  );

  static final TextStyle labelRegular16 = _figma(
    weight: FontWeight.w400,
    size: 16,
    lineHeight: 24,
    letterSpacingPercent: -1,
  );

  static final TextStyle labelSemiBold14 = _figma(
    weight: FontWeight.w600,
    size: 14,
    lineHeight: 20,
    letterSpacingPercent: -1,
  );

  static final TextStyle labelMedium14 = _figma(
    weight: FontWeight.w500,
    size: 14,
    lineHeight: 20,
    letterSpacingPercent: -1,
  );

  static final TextStyle labelSemiBold12 = _figma(
    weight: FontWeight.w600,
    size: 12,
    lineHeight: 18,
    letterSpacingPercent: -1,
  );

  static final TextStyle labelMedium12 = _figma(
    weight: FontWeight.w500,
    size: 12,
    lineHeight: 18,
    letterSpacingPercent: -1,
  );


  // Caption

  static final TextStyle captionSemiBold14 = _figma(
    weight: FontWeight.w600,
    size: 14,
    lineHeight: 20,
    letterSpacingPercent: -1,
  );

  static final TextStyle captionMedium14 = _figma(
    weight: FontWeight.w500,
    size: 14,
    lineHeight: 20,
    letterSpacingPercent: -1,
  );

  static final TextStyle captionRegular14 = _figma(
    weight: FontWeight.w400,
    size: 14,
    lineHeight: 20,
    letterSpacingPercent: -1,
  );

  static final TextStyle captionMedium12 = _figma(
    weight: FontWeight.w500,
    size: 12,
    lineHeight: 16,
    letterSpacingPercent: -1,
  );

  static final TextStyle captionRegular12 = _figma(
    weight: FontWeight.w400,
    size: 12,
    lineHeight: 16,
    letterSpacingPercent: -1,
  );
}