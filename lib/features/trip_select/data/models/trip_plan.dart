import 'package:plan_b/shared/models/destination.dart';
import 'package:plan_b/shared/models/trip_plan_cost_item.dart';

// 기존에 trip_plan.dart만 import하던 파일(더미 등)이 그대로 동작하도록 다시 내보냄
export 'package:plan_b/shared/models/trip_plan_cost_item.dart';

/// 여행 플랜 티켓(trip_plan_ticket)에 표시할 데이터
class TripPlan {
  const TripPlan({
    required this.id,
    required this.rank,
    required this.destination,
    required this.tags,
    required this.highlights,
    required this.accommodation,
    required this.flight,
    required this.totalCost,
    required this.summary,
  });

  final String id;          // 선택 상태 관리용 식별자
  final int rank;           // 'TOP n' 태그
  final Destination? destination;     // 여행지 (모르는 값이 오면 null)
  final List<String> tags;  // 도쿄, 하코네, 디즈니랜드 ('#' 없이)
  final List<TripPlanCostItem> highlights; // 주요 일정 + 비용
  final TripPlanCostItem accommodation;    // 숙소
  final TripPlanCostItem flight;           // 항공
  final String totalCost;   // 총 예상 비용 (인당)
  final String summary;     // 하단 한 줄 요약
}
