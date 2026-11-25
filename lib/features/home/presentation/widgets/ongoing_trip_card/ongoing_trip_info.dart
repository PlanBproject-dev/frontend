// 진행중인 여행 카드) 썸네일 + 디데이 태그 + 여행지 + 해시태그

import 'package:flutter/material.dart';

import 'package:plan_b/core/theme/app_colors.dart';
import 'package:plan_b/core/theme/app_text_styles.dart';
import 'package:plan_b/shared/widgets/feedback/skeleton/skeleton_image.dart';
import 'package:plan_b/features/home/presentation/widgets/d_day_tag.dart';

class OngoingTripInfo extends StatelessWidget {
  const OngoingTripInfo({
    super.key,
    required this.thumbnail,
    required this.daysLeft,
    required this.destination,
    required this.tags,
  });

  final ImageProvider thumbnail;
  final int daysLeft;
  final String destination;
  final List<String> tags;

  @override
  Widget build(BuildContext context) {
    final tagStyle = AppTextStyles.labelMedium14.copyWith(color: AppColors.gray500);

    return ColoredBox(
      color: AppColors.white,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 썸네일
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: SkeletonImage(
                image: thumbnail,
                width: 60,
                height: 60,
              ),
            ),
            const SizedBox(width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 디데이 태그 + 여행지
                  Row(
                    children: [
                      DDayTag(daysLeft: daysLeft),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          destination,
                          style: AppTextStyles.titleSemiBold18.copyWith(
                            color: AppColors.gray800,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),

                  // 해시태그 (넘치면 다음 줄로)
                  Wrap(
                    spacing: 4,
                    runSpacing: 2,
                    children: [
                      for (final tag in tags)
                        // Row 대신 Text 하나로 구성: Wrap이 준 폭 안에서 크기가 정해져 카드 밖으로 넘치지 않음
                        // '#'과 태그 사이 2px 간격은 WidgetSpan으로 유지
                        Text.rich(
                          TextSpan(
                            children: [
                              const TextSpan(text: '#'),
                              const WidgetSpan(child: SizedBox(width: 2)),
                              TextSpan(text: tag),
                            ],
                          ),
                          style: tagStyle,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis, // 한 줄보다 긴 태그는 말줄임
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}