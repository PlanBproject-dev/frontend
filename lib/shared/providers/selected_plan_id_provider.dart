// 홈에서 선택한 여행 플랜 id
// - 로컬 Shell의 여행 플래너 / 월별 여행 준비 / 여행 코스 화면이 이 값을 기준으로 데이터를 보여주도록 한다.
// - 홈에서 플랜 관련 화면으로 이동하기 전에 select()를 호출해야 함.

import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectedPlanIdNotifier extends Notifier<String?> {
  @override
  String? build() => null; // 선택된 플랜 없을 때

  void select(String planId) => state = planId;

  void clear() => state = null;
}

final selectedPlanIdProvider =
    NotifierProvider<SelectedPlanIdNotifier, String?>(SelectedPlanIdNotifier.new);