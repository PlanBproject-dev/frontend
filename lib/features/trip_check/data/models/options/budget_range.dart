/// 지갑 기준 플로우) 1인당 최대 예산 선택지
enum BudgetRange {
  upTo100('~100만원', '초저가 단기 여행', 100),
  upTo200('~200만원', '가성비 여행, 가까운 아시아 중심', 200),
  upTo300('~300만원', '평균적인 예산의 무리 없는 여행', 300),
  upTo400('~400만원', '선택의 폭이 넓은 여유로운 여행', 400),
  over400('400만원 이상', '고급 여행, 장거리 여행도 가능', null);

  const BudgetRange(this.label, this.caption, this.maxManwon);

  final String label;    // 왼쪽 금액 텍스트
  final String caption;  // 오른쪽 설명 텍스트
  final int? maxManwon;  // 상한 금액(만원 단위). null이면 상한 없음 (400만원 이상)
}