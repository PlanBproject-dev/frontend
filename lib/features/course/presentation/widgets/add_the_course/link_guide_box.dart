// 코스 추가 화면) 하단 안내 박스

import 'package:flutter/material.dart';

import 'package:plan_b/core/theme/app_colors.dart';
import 'package:plan_b/core/theme/app_text_styles.dart';

class LinkGuideBox extends StatelessWidget {
  const LinkGuideBox({super.key});

  static const double _radius = 12;

  static const List<({String title, List<String> items})> _sections = [
    (
      title: '단, 링크에 코스 정보가 포함되어야 해요',
      items: ['여행 코스명', '코스 가격 정보'],
    ),
    (
      title: 'AI가 분석 가능한 콘텐츠 유형 구분',
      items: ['링크 내 텍스트 · 이미지: 가능', '영상 · 각종 문서(.pdf 등): 불가능'],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      decoration: BoxDecoration(
        color: AppColors.bgSolidBasic,
        borderRadius: BorderRadius.circular(_radius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 12, // 섹션 사이 간격
        children: [
          for (final section in _sections)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 4, // 섹션 제목 ~ 목록
              children: [
                Text(
                  section.title,
                  style: AppTextStyles.labelMedium14.copyWith(color: AppColors.gray700),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (final item in section.items) _GuideBullet(text: item),
                  ],
                ),
              ],
            ),
        ],
      ),
    );
  }
}

/// 불렛 리스트 한줄
class _GuideBullet extends StatelessWidget {
  const _GuideBullet({required this.text});

  final String text;

  static const double _bulletWidth = 18;

  @override
  Widget build(BuildContext context) {
    final TextStyle style =
        AppTextStyles.labelMedium12.copyWith(color: AppColors.gray600);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: _bulletWidth,
          child: Text('•', style: style, textAlign: TextAlign.center),
        ),
        Expanded(child: Text(text, style: style)),
      ],
    );
  }
}