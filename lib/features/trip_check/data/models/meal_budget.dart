/// 목표 기준 플로우) 1인당 한 끼 식사 예산 선택지
enum MealBudget {
  upTo10k('~10,000원', '가벼운 식사', 10000),
  upTo30k('~30,000원', '부담 없는 현지 식사', 30000),
  upTo50k('~50,000원', '여유 있게 즐길 수 있는 식사', 50000),
  upTo100k('~10만원', '분위기 좋은 식당의 근사한 식사', 100000),
  over100k('10만원 이상', '고급 미식 경험', null);

  const MealBudget(this.label, this.caption, this.maxWon);

  final String label;   // 왼쪽 금액 텍스트
  final String caption; // 오른쪽 설명 텍스트
  final int? maxWon;    // 상한 금액(원 단위). null이면 상한 없음 (10만원 이상)
}