// 여행 고르기 상단 '여행 기본 정보' 박스
// - 표시할 행 구성만 지갑 기준 플로우냐, 목표 기준 플로우냐에 따라 서로 다름

import 'package:flutter/material.dart';

import 'package:plan_b/core/theme/app_colors.dart';
import 'package:plan_b/core/theme/app_text_styles.dart';

class TripInfoRow {
  const TripInfoRow(this.label, this.values);

  final String label;         // 국가, 시기, 인원, 예산
  final List<String> values;  // 여러 개면 ' | '로 이어서 표시 (4명 | 가족)
}

class TripBasicInfoSection extends StatelessWidget {
  const TripBasicInfoSection({super.key, required this.rows});

  final List<TripInfoRow> rows;

  @override
  Widget build(BuildContext context) {
    final labelStyle = AppTextStyles.bodyMedium14.copyWith(color: AppColors.gray400);
    final valueStyle = AppTextStyles.bodyMedium14.copyWith(color: AppColors.gray800);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: 12,
        children: [
          Text(
            '여행 기본 정보',
            style: AppTextStyles.titleSemiBold18.copyWith(color: AppColors.gray700),
          ),
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: AppColors.blue50,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              spacing: 4,
              children: [
                for (final row in rows)
                  Row(
                    spacing: 16,
                    children: [
                      Text(row.label, style: labelStyle),
                      Flexible(
                        child: Text(
                          row.values.isEmpty ? '-' : row.values.join(' | '),
                          style: valueStyle,
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}