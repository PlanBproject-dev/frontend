// shadow 및 background blur 이펙트 스타일 정의

import 'dart:ui' show ImageFilter;

import 'package:flutter/material.dart';

abstract final class AppEffects {
  /// box_shadow_sm
  static const List<BoxShadow> boxShadowSm = [
    BoxShadow(
      color: Color(0x1A000000),
      offset: Offset(0, 2),
      blurRadius: 4,
    ),
  ];

  /// box_shadow_md
  static const List<BoxShadow> boxShadowMd = [
    BoxShadow(
      color: Color(0x1F000000),
      offset: Offset(0, 4),
      blurRadius: 8,
    ),
  ];

  /// box_shadow_lg
  static const List<BoxShadow> boxShadowLg = [
    BoxShadow(
      color: Color(0x14000000),
      offset: Offset(0, 15),
      blurRadius: 30,
    ),
  ];

  /// box_dimmed_light_lg: box_shadow_lg + background blur 20
  /// 그림자와 배경 블러를 플러터에서는 따로 적용해야 해서 두 값으로 나눔
  static const List<BoxShadow> boxDimmedLightLgShadow = boxShadowLg;

  /// 피그마의 background blur 20 → 플러터의 sigma 10 (피그마 블러 값의 절반)
  static final ImageFilter boxDimmedLightLgBlur = ImageFilter.blur(
    sigmaX: 10,
    sigmaY: 10,
  );
}