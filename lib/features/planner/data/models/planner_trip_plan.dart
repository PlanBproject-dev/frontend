import 'package:plan_b/features/trip_check/data/models/options/trip_selection_type.dart';
import 'package:plan_b/shared/models/trip_plan_cost_item.dart';

/// 나의 여행 플래너(my_trip_planner)에 표시할 여행 플랜 기본 데이터
/// API 스펙 확정 전이라 UI 기준으로만 구조화함
/// 스웨거 확인 후 fromJson / DTO 매핑 추가 예정
class PlannerTripPlan {
  const PlannerTripPlan({
    required this.id,
    required this.tripType,
    required this.title,
    required this.period,
    required this.people,
    required this.condition,
    required this.highlights,
    required this.accommodation,
    required this.flight,
    required this.totalCost,
  });

  final String id;                          // 플랜 id (여행 코스 화면 이동용)
  final TripSelectionType tripType;         // 플랜을 만든 플로우 (budget: 지갑 기준 / goal: 여행 목표 기준)
  final String title;                       // 일본 8월 여행 플랜
  final String period;                      // 26.08.10 - 26.08.18
  final String people;                      // 4명 | 가족
  final String condition;                   // 지갑 기준: 인당 최대 300만원 / 목표 기준: 1인당 한 끼 최대 5만원 기준
  final List<TripPlanCostItem> highlights;  // 주요 일정 + 비용
  final TripPlanCostItem accommodation;     // 숙소
  final TripPlanCostItem flight;            // 항공
  final String totalCost;                   // 총 예상 비용 (인당)
}
