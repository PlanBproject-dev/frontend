// 앱 최상단에서 전역 로딩 오버레이를 그리는 위젯
// - MaterialApp.router의 builder에서 Router(모든 화면 및 모달) 바깥을 감싸므로 상단바, 탭바, 모달까지 전부 덮음

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:plan_b/shared/providers/global_loading_provider.dart';
import 'package:plan_b/shared/widgets/feedback/global_loading/global_loading_overlay.dart';

class GlobalLoadingHost extends ConsumerWidget {
  const GlobalLoadingHost({super.key, required this.child});

  final Widget child; // 앱 전체 (라우터)

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isLoading = ref.watch(globalLoadingProvider) > 0;

    return Stack(
      fit: StackFit.expand,
      children: [
        child,
        if (isLoading) const GlobalLoadingOverlay(),
      ],
    );
  }
}