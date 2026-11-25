/// 항목명 + 비용 (여행 플랜 티켓·영수증·플래너 공통)
class TripPlanCostItem {
  const TripPlanCostItem({
    required this.title,
    required this.cost,
  });

  final String title; // 도쿄 핵심 명소 투어
  final String cost;  // 약 15만원 / 무료 / 1만원 이하 / 비용 알 수 없음
}
