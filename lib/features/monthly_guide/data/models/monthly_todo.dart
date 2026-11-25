import 'package:plan_b/features/monthly_guide/data/models/monthly_todo_type.dart';

/// 월별 가이드의 할 일 한 개
/// API 스펙 확정 전이라 UI 기준으로만 구조화함
class MonthlyTodo {
  const MonthlyTodo({
    required this.id,
    required this.type,
    required this.title,
    this.caption,
    this.budgetStatus,
    this.isCompleted = false,
  });

  final String id;
  final MonthlyTodoType type;
  final String title;          // 항공권 예매 / 60만원 모으기
  final String? caption;       // reservation 전용: 약 75만원 내외
  final String? budgetStatus;  // budget 전용: 120만원 / 235만원
  final bool isCompleted;      // 완료 체크 여부

  MonthlyTodo copyWith({bool? isCompleted}) => MonthlyTodo(
        id: id,
        type: type,
        title: title,
        caption: caption,
        budgetStatus: budgetStatus,
        isCompleted: isCompleted ?? this.isCompleted,
      );
}