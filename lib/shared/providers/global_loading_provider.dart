// 전역 로딩 상태

import 'package:flutter_riverpod/flutter_riverpod.dart';

class GlobalLoadingNotifier extends Notifier<int> {
  @override
  int build() => 0; // 진행 중인 로딩 개수

  void show() => state = state + 1;

  void hide() => state = state > 0 ? state - 1 : 0;

  /// task가 끝날 때까지 로딩 표시 (성공or실패와 관계없이 끝나면 로딩 숨김)
  Future<T> run<T>(Future<T> Function() task) async {
    show();
    try {
      return await task();
    } finally {
      hide();
    }
  }
}

final globalLoadingProvider =
    NotifierProvider<GlobalLoadingNotifier, int>(GlobalLoadingNotifier.new);