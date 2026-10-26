// 폰트, 크기, 굵기, 행간, 자간 정의

import 'package:flutter/material.dart';

abstract final class AppTextStyles {
  AppTextStyles._();

  /// font family
  static const String _fontFamily = 'Pretendard';

  /// 피그마의 값을 그대로 넣으면 Flutter의 TextStyle로 변환해주는 보조 함수
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
      height: lineHeight / size,  // height: 폰트 크기에 대한 배수
      letterSpacing: size * letterSpacingPercent / 100,  // letterSpacing: 폰트 크기 기준으로 논리 픽셀을 계산하여 적용

      // 아래와 같이 지정 시 행간이 글자 위아래에 균등하게 나뉨
      // 피그마와 같은 방식이라 디자인을 더 정확하게 구현 가능
      leadingDistribution: TextLeadingDistribution.even,
    );
  }

  /// Title

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

  // Label

  // Caption

}