// 컬러 상수 정의

import 'package:flutter/material.dart';

abstract final class AppColors {
  /// Static
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF111111);

  /// Grayscale
  static const Color gray50 = Color(0xFFE2E6EA);
  static const Color gray100 = Color(0xFFCAD0D8);
  static const Color gray200 = Color(0xFFB0BAC5);
  static const Color gray300 = Color(0xFF8C9AAB);
  static const Color gray400 = Color(0xFF76869A);
  static const Color gray500 = Color(0xFF546881);
  static const Color gray600 = Color(0xFF4C5F75);
  static const Color gray700 = Color(0xFF3C4A5C);
  static const Color gray800 = Color(0xFF2E3947);

  /// Blue
  static const Color blue50 = Color(0xFFEEF5FD);
  static const Color blue100 = Color(0xFFD5E5FA);
  static const Color blue200 = Color(0xFFA3C8F5);
  static const Color blue300 = Color(0xFF78AFF1);
  static const Color blue400 = Color(0xFF5E9FEE);
  static const Color blue500 = Color(0xFF3687EA);
  static const Color blue600 = Color(0xFF317BD5);
  static const Color blue700 = Color(0xFF2660A6);
  static const Color blue800 = Color(0xFF1E4A81);
  static const Color blue900 = Color(0xFF173962);

  /// Background
  static const Color bgSolidBasic = Color(0xFFF5F6F8);
  static const LinearGradient bgGradientTop = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [white, blue50],
    stops: [0.0, 1.0],
  );
  static const LinearGradient bgGradientBottom = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [blue50, white],
    stops: [0.0, 1.0],
  );
  static const LinearGradient bgGradientLeft = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [blue50, white],
    stops: [0.0, 1.0],
  );
  static const LinearGradient bgGradientRight = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [white, blue50],
    stops: [0.0, 1.0],
  );

  /// System
  static const Color systemSuccess = Color(0xFF4FC378);
  static const Color systemAlert = Color(0xFFFFC84D);
  static const Color systemWarning = Color(0xffE75454);

  /// Dim
  static const Color dimSurfaceDark = Color(0xE63C4A5C);
  static const Color dimSurfaceLight = Color(0xB3FFFFFF);
}