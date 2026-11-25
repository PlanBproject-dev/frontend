/// 목표 기준 플로우) 1인당 한 끼 식사 예산 선택지
enum MealBudget {
  upTo10k('~10,000원', '가벼운 식사'),
  upTo30k('~30,000원', '부담 없는 현지 식사'),
  upTo50k('~50,000원', '여유 있게 즐길 수 있는 식사'),
  upTo100k('~10만원', '분위기 좋은 식당의 근사한 식사'),
  over100k('10만원 이상', '고급 미식 경험');

  const MealBudget(this.label, this.caption);

  final String label;   // 왼쪽 금액 텍스트
  final String caption; // 오른쪽 설명 텍스트
}