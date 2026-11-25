import 'package:flutter/material.dart';

import 'package:plan_b/core/theme/app_text_styles.dart';

/// #태그 목록 (# 과 태그 사이 2px, 태그 사이 8px)
class PlanTags extends StatelessWidget {
  const PlanTags({
    super.key,
    required this.tags,
    required this.color,
    this.runSpacing = 2,
  });

  final List<String> tags;
  final Color color;
  final double runSpacing; // 줄 간격 (티켓 2 / 영수증 8)

  @override
  Widget build(BuildContext context) {
    final TextStyle style = AppTextStyles.labelMedium16.copyWith(color: color);

    return Wrap(
      spacing: 8,
      runSpacing: runSpacing,
      children: [
        for (final tag in tags)
          Text.rich(
            TextSpan(
              children: [
                const TextSpan(text: '#'),
                const WidgetSpan(child: SizedBox(width: 2)), // '#'과 태그 사이 2px
                TextSpan(text: tag),
              ],
            ),
            style: style,
            maxLines: 1,
            overflow: TextOverflow.ellipsis, // 한 줄보다 긴 태그는 말줄임
          ),
      ],
    );
  }
}