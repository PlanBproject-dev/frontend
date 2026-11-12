/// 여행 플랜 티켓(trip_plan_ticket)에 표시할 데이터
/// API 스펙 확정 전이라 UI 기준으로만 구조화함
/// 스웨거 확인 후 fromJson / DTO 매핑 추가 예정
class TripPlan {
  const TripPlan({
    required this.id,
    required this.rank,
    required this.country,
    required this.tags,
    required this.highlights,
    required this.accommodation,
    required this.flight,
    required this.totalCost,
    required this.summary,
  });

  final String id;          // 선택 상태 관리용 식별자
  final int rank;           // 'TOP n' 태그
  final String country;     // 일본
  final List<String> tags;  // 도쿄, 하코네, 디즈니랜드 ('#' 없이)
  final List<TripPlanCostItem> highlights; // 주요 일정 + 비용
  final TripPlanCostItem accommodation;    // 숙소
  final TripPlanCostItem flight;           // 항공
  final String totalCost;   // 총 예상 비용 (인당)
  final String summary;     // 하단 한 줄 요약
}

class TripPlanCostItem {
  const TripPlanCostItem({
    required this.title,
    required this.cost,
  });

  final String title; // 도쿄 핵심 명소 투어
  final String cost;  // 약 15만원
}