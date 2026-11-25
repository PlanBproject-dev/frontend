import 'package:plan_b/features/trip_select/data/models/trip_plan.dart';

/// budget_tag의 예산 수준
enum BudgetLevel {
  high,   // 고예산
  medium, // 중예산
  low,    // 저예산
}

/// 목표 기준 플로우: 예산 수준 + 플랜 (영수증 하나)
typedef BudgetLevelPlan = ({BudgetLevel level, TripPlan plan});