import 'package:flutter/material.dart';

import 'package:plan_b/features/trip_check/data/models/trip_selection_type.dart';
import 'package:plan_b/features/trip_check/presentation/widgets/trip_selection/trip_selection_card.dart';

class TripSelection extends StatelessWidget {
  const TripSelection({
    super.key,
    required this.selected,
    required this.onSelected,
  });

  final TripSelectionType? selected;                // null이면 아무것도 선택 안 됨(default)
  final ValueChanged<TripSelectionType> onSelected; // 카드를 누르면 해당 타입 전달

  static const double _gap = 16; // 카드 사이 간격 16으로 고정

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (final (i, type) in TripSelectionType.values.indexed) ...[
          if (i > 0) const SizedBox(height: _gap),
          TripSelectionCard(
            type: type,
            isSelected: selected == type,
            onTap: () => onSelected(type),
          ),
        ],
      ],
    );
  }
}