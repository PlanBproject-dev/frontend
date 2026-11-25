// 추출된 코스 카드) '원본 출처' 텍스트 링크
// 누르면 외부 브라우저로 원본 페이지 열리도록

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/foundation.dart';

import 'package:plan_b/core/theme/app_colors.dart';
import 'package:plan_b/core/theme/app_text_styles.dart';
import 'package:plan_b/shared/widgets/feedback/toast.dart';

class CourseSourceLink extends StatelessWidget {
  const CourseSourceLink({super.key, required this.url});

  final String url; // 원본 출처 링크

  static const double _iconSize = 16;

    Future<void> _open(BuildContext context) async {
    final Uri? uri = Uri.tryParse(url);

    // 링크 형식이 잘못돼서 브라우저를 띄울 수 없는 경우
    if (uri == null || !_isWebUrl(uri)) {
      _showOpenFailedToast(context);
      return;
    }

    bool opened = false;
    try {
      // 인앱브라우저로 열리도록
      opened = await launchUrl(uri, mode: LaunchMode.inAppBrowserView);
    } catch (_) {
      opened = false;
    }
    if (opened) return;

    // iOS(SFSafariViewController)는 브라우저가 뜬 뒤 첫 로드 전에 닫아도 실패(false/예외)로 응답함
    // > 브라우저는 이미 열렸던 것이므로 실패 토스트 X (실제 로드 실패면 Safari 화면에서 에러를 이미 보여줌)
    if (defaultTargetPlatform == TargetPlatform.iOS) return;

    // Android 등: 브라우저를 띄우지 못한 경우만 실패로 응답함
    if (context.mounted) _showOpenFailedToast(context);
  }

  void _showOpenFailedToast(BuildContext context) {
    showToast(
      context,
      text: '원본 페이지를 열지 못했어요.',
      type: ToastType.warning,
    );
  }

  /// 인앱브라우저로 열 수 있는 웹 링크인지 (http/https + host)
  static bool _isWebUrl(Uri uri) =>
      (uri.scheme == 'https' || uri.scheme == 'http') && uri.host.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      link: true,
      label: '원본 출처 열기',
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => _open(context),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          spacing: 2,
          children: [
            Text(
              '원본 출처',
              style: AppTextStyles.bodyMedium14.copyWith(
                color: AppColors.gray600,
                decoration: TextDecoration.underline,
                decorationColor: AppColors.gray600,
              ),
            ),
            SvgPicture.asset(
              'assets/icons/ic_arrow_link_16px.svg',
              width: _iconSize,
              height: _iconSize,
            ),
          ],
        ),
      ),
    );
  }
}