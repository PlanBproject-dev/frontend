// Flutter 공통 테마에 컬러, 텍스트 스타일 등을 연결

import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_text_styles.dart';

abstract final class AppTheme {
  static final ThemeData light = ThemeData(
    // 기본 라이트 모드
    brightness: Brightness.light,

    // Material 3 사용
    useMaterial3: true,

    // 앱 전체 기본 배경색
    scaffoldBackgroundColor: AppColors.white,

    // 앱 전체 기본 텍스트 스타일: bodyRegular16 적용
    textTheme: TextTheme(
      bodyLarge: AppTextStyles.bodyRegular16,
      bodyMedium: AppTextStyles.bodyRegular16,
    ),
  );
}
