// 월별 가이드를 제공하지 않는 플랜
// - 가이드 조회 응답에 이번 기간이 없거나, 준비할 항목(저축 목표, 유료 준비 항목)이 하나도 없음
// - 가이드가 없고 시작일이 오늘이거나 지난 플랜 (가이드를 만들지 않음)
// 페이지에서 '불러오지 못했어요'와 구분해서 '가이드를 제공하지 않아요'로 안내하기 위해 따로 둠

class MonthlyGuideNotProvidedException implements Exception {
  const MonthlyGuideNotProvidedException();

  @override
  String toString() => 'MonthlyGuideNotProvidedException';
}
