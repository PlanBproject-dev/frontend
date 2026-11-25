// 이 위젯이 화면에 있는 동안 전역 로딩 오버레이를 표시
// - AsyncValue 로딩에 사용: asyncValue.when(loading: () => const ShowGlobalLoading(), ...)
// - 데이터가 오면 이 위젯이 다른 위젯으로 바뀌면서(dispose) 로딩이 자동으로 꺼짐

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:plan_b/shared/providers/global_loading_provider.dart';

class ShowGlobalLoading extends ConsumerStatefulWidget {
  const ShowGlobalLoading({super.key});

  @override
  ConsumerState<ShowGlobalLoading> createState() => _ShowGlobalLoadingState();
}

class _ShowGlobalLoadingState extends ConsumerState<ShowGlobalLoading> {
  late final GlobalLoadingNotifier _loading;
  bool _isShown = false; // show()가 실제로 호출됐는지 (hide()가 짝을 맞춰 한 번만 불리도록)

  @override
  void initState() {
    super.initState();
    _loading = ref.read(globalLoadingProvider.notifier);

    // 위젯 빌드 중에는 provider 값을 바꿀 수 없으므로 현재 빌드가 끝난 뒤 반영
    Future.microtask(() {
      if (!mounted) return; // 그 사이 이미 사라졌으면 표시하지 않음
      _loading.show();
      _isShown = true;
    });
  }

  @override
  void dispose() {
    // dispose도 화면 갱신 중에 불리므로 끝난 뒤 반영
    if (_isShown) Future.microtask(_loading.hide);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => const SizedBox.shrink();
}