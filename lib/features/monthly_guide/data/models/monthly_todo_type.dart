/// 월별 여행 준비 가이드의 할 일 종류
enum MonthlyTodoType {
  /// 예약형 할 일 (항공권, 숙소 예약 등) : 제목 + 설명
  reservation,

  /// 저축 목표형 할 일 : 제목 + 목표 누적 금액
  budget,
}