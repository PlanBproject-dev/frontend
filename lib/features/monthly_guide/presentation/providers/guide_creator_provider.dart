// 월별 가이드 생성 (같은 플랜에 생성 요청이 두 번 나가지 않도록 관리)

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:plan_b/core/auth/auth_provider.dart';
import 'package:plan_b/features/home/presentation/providers/home_plans_provider.dart';
import 'package:plan_b/features/monthly_guide/data/repositories/monthly_guide_repository.dart';

class GuideCreator {
  GuideCreator(this._ref, this._repository);
  final Ref _ref;
  final MonthlyGuideRepository _repository;

  /// confirmedPlanId -> 생성 요청
  final Map<int, Future<int>> _requests = {};

  /// '여행 플랜 다시 선택하기'로 기존 가이드가 초기화될 때 생성 기록 삭제
  /// (다시 확정했을 때 서버가 같은 confirmedPlanId를 써도 가이드를 새로 생성하도록)
  void forget(int confirmedPlanId) => _requests.remove(confirmedPlanId);

  /// 월별 가이드 생성 (요청 중이거나 이미 만들었으면 그 결과를 그대로 반환)
  /// - 반환: travelGuideId
  /// - 성공/실패와 관계없이 homePlansProvider를 갱신 (다음 진입이 최신 travelGuideId를 읽도록)
  Future<int> ensureGuide(int confirmedPlanId) {
    final Future<int>? pending = _requests[confirmedPlanId];
    if (pending != null) return pending;

    final Future<int> request = _repository.createGuide(confirmedPlanId);
    _requests[confirmedPlanId] = request;

    request.then(
      (_) => _ref.invalidate(homePlansProvider),
      onError: (Object _) {
        // 실패하면 기록을 지워서 다음 호출에서 재시도할 수 있게
        if (identical(_requests[confirmedPlanId], request)) {
          _requests.remove(confirmedPlanId);
        }
        // 서버에는 생성됐지만 응답 수신만 실패했을 수 있으므로 실패해도 목록 갱신
        _ref.invalidate(homePlansProvider);
      },
    );
    return request;
  }
}

/// autoDispose 아님: 완료 페이지 > 홈 > 가이드 탭으로 이동해도 기록이 유지되도록.
/// (호출한 화면이 사라져도 홈 목록 갱신이 빠지지 않도록 무효화도 여기서 처리)
final guideCreatorProvider = Provider<GuideCreator>((ref) {
  // 로그아웃하면 새로 만들어서 이전 계정의 기록을 비움
  ref.watch(authProvider.select((auth) => auth.isLoggedIn));
  return GuideCreator(ref, ref.read(monthlyGuideRepositoryProvider));
});