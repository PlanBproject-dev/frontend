// 토스트
// showToast()로 호출하면 하단 CTA 영역 위 16px에 표시
// CTA 없으면 화면 최하단 위 16px에 표시됨
// 떴다가 2초 뒤에 ease-in-out으로 페이드 아웃되도록 처리.

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:plan_b/core/theme/app_colors.dart';
import 'package:plan_b/core/theme/app_text_styles.dart';

enum ToastType {
  success('assets/icons/ic_success_20px.svg'),
  alert('assets/icons/ic_alert_20px.svg'),
  warning('assets/icons/ic_warning_20px.svg');

  const ToastType(this.iconPath);

  final String iconPath;
}

/// showToast(): 토스트를 화면에 띄운다
void showToast(
  BuildContext context, {
    required String text,
    ToastType type = ToastType.success,
  }) {
    const visibleDuration = Duration(seconds: 2);   // 토스트가 온전히 보이는 시간
    const fadeDuration = Duration(milliseconds: 300);   // 토스트가 사라지는 데 걸리는 시간

    ScaffoldMessenger.of(context)
    // 이미 떠 있는 토스트가 있으면 즉시 지우고 새 토스트로 교체한다.
    ..removeCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: _FadeOutAfter(
          delay: visibleDuration,
          duration: fadeDuration,
          child: Toast(text: text, type: type),
        ),
        duration: visibleDuration + fadeDuration,
        behavior: SnackBarBehavior.floating,  // CTA 위에 뜨도록
        margin: const EdgeInsets.fromLTRB(24, 0, 24, 16), // 좌우 화면 패딩 24 + CTA와의 간격 16
        padding: EdgeInsets.zero,

        // SnackBar 기본스타일 제거
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),

      // SnackBar 자체의 기본 등장/퇴장 애니메이션을 없앰 (토스트가 즉시 나타나도록)
      snackBarAnimationStyle: const AnimationStyle(
        duration: Duration.zero,
        reverseDuration: Duration.zero,
      ),
    );
  }


  /// 토스트 UI
  class Toast extends StatelessWidget {
    const Toast({
      super.key,
      required this.text,
      this.type = ToastType.success,
    });

    final String text;
    final ToastType type;

    @override
    Widget build(BuildContext context) {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: AppColors.dimSurfaceDark,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 46),
              child: Text(
                text,
                style: AppTextStyles.labelMedium16.copyWith(
                  color: AppColors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            // 아이콘: 왼쪽에서 16px 지점에 위치.
            Positioned(
              left: 16,
              child: SvgPicture.asset(
                type.iconPath,
                width: 20,
                height: 20,
              ),
            ),
          ],
        ),
      );
    }
  }


  /// _FadeOutAfter: delay 후에 child를 페이드 아웃시키는 위젯
  class _FadeOutAfter extends StatefulWidget {
    const _FadeOutAfter({
      required this.delay,
      required this.duration,
      required this.child,
    });

    final Duration delay;
    final Duration duration;
    final Widget child;


    @override
    State<_FadeOutAfter> createState() => _FadeOutAfterState();
  }

  class _FadeOutAfterState extends State<_FadeOutAfter> {
    Timer? _timer;
    bool _isVisible = true;

    @override
    void initState() {
      super.initState();

      _timer = Timer(widget.delay, () {
      if (mounted) setState(() => _isVisible = false);
    });
    }

    @override
    void dispose() {
      _timer?.cancel();
      super.dispose();
    }

    @override
    Widget build(BuildContext context) {
      return AnimatedOpacity(
        opacity: _isVisible ? 1: 0,
        duration: widget.duration,
        curve: Curves.easeInOut,
        child: widget.child,
      );
    }
  }