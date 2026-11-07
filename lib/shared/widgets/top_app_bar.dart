import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:plan_b/core/theme/app_colors.dart';
import 'package:plan_b/core/theme/app_text_styles.dart';

class TopAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TopAppBar({
    super.key,
    this.title,
    this.onBack,
  });

  final String? title;  // null이면 제목 없이 뒤로가기 버튼만 표시
  final VoidCallback? onBack;   // null이면 이전 화면으로 pop

  static const double _height = 56; // 높이는 고정값 56으로 설정

  @override
  Size get preferredSize => const Size.fromHeight(_height);   // 높이만 56으로 정해서 Scaffold에 알려줌 & 너비는 제한하지 않음 (너비는 Scaffold가 화면 너비에 맞춰줌)

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false, // 상태바 영역만 피하도록
      child: SizedBox(
        height: _height,
        child: Stack(
          alignment: Alignment.center,
          children: [
            // 제목이 있을 경우
            if (title != null)
            Padding(
              // 제목이 길어져도 좌측 뒤로가기 화살표와 겹치지 않도록 좌우 58씩 비움
              // (좌측 패딩 24 + 아이콘 24 + 간격 10)
              padding: const EdgeInsets.symmetric(horizontal: 58),
              child: Text(
                title!,
                style: AppTextStyles.titleSemiBold18.copyWith(
                  color: AppColors.black,
                ),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),

            Positioned(
              left: 12,
              child: Semantics(
                button: true,
                label: '뒤로가기',
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: onBack ?? () => Navigator.maybePop(context),
                  child: SizedBox.square(
                    dimension: 48,
                    child: Center(
                      child: SvgPicture.asset(
                        'assets/icons/ic_arrow_back_24px.svg',
                        width: 24,
                        height: 24,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}