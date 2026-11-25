// 여행 고르기 상단 '여행 기본 정보' 박스
// - 표시할 행 구성만 지갑 기준 플로우냐, 목표 기준 플로우냐에 따라 서로 다름

import 'package:flutter/material.dart';

import 'package:plan_b/core/theme/app_colors.dart';
import 'package:plan_b/core/theme/app_text_styles.dart';

class TripInfoRow {
  const TripInfoRow(this.label, this.values);

  final String label;         // 여행지, 시기, 인원, 예산
  final List<String> values;  // 여러 개면 ' | '로 이어서 표시 (4명 | 가족)
}

class TripBasicInfoSection extends StatelessWidget {
  const TripBasicInfoSection({
    super.key,
    required this.rows,
    this.alignValues = false,
  });

  final List<TripInfoRow> rows;
  /// false: 라벨 길이만큼만 차지 (지갑 기준: 기존 레이아웃)
  /// true: 가장 긴 라벨 너비에 맞춰 값의 시작 위치를 정렬 (목표 기준: 여행지/시기/인원)
  final bool alignValues;

  static const double _rowGap = 4;    // 행 간격
  static const double _labelGap = 16; // 라벨 ~ 값 간격

  static String _valueText(TripInfoRow row) =>
      row.values.isEmpty ? '-' : row.values.join(' | ');

  /// 기존 레이아웃 (지갑 기준): 기존 코드 그대로
  Widget _buildRows(TextStyle labelStyle, TextStyle valueStyle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: _rowGap,
      children: [
        for (final row in rows)
          Row(
            spacing: _labelGap,
            children: [
              Text(row.label, style: labelStyle),
              Flexible(child: Text(_valueText(row), style: valueStyle)),
            ],
          ),
      ],
    );
  }

  /// 값 정렬 레이아웃 (목표 기준)
  /// 라벨 열 너비 = 가장 긴 라벨 너비 (피그마의 '여행지' 너비)
  Widget _buildAlignedRows(TextStyle labelStyle, TextStyle valueStyle) {
    return Table(
      columnWidths: const {
        0: IntrinsicColumnWidth(), // 가장 긴 라벨에 맞춤
        1: FlexColumnWidth(),      // 남은 너비는 값
      },
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: [
        for (final (index, row) in rows.indexed)
          TableRow(
            children: [
              Padding(
                // Table에는 spacing이 없어서 첫 행을 뺀 나머지에 위 여백을 줌
                padding: EdgeInsets.only(
                  top: index == 0 ? 0 : _rowGap,
                  right: _labelGap,
                ),
                child: Text(row.label, style: labelStyle),
              ),
              Padding(
                padding: EdgeInsets.only(top: index == 0 ? 0 : _rowGap),
                child: Text(_valueText(row), style: valueStyle),
              ),
            ],
          ),
      ],
    );
  }

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
            child: alignValues
                ? _buildAlignedRows(labelStyle, valueStyle)
                : _buildRows(labelStyle, valueStyle),
          ),
        ],
      ),
    );
  }
}