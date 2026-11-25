/// 월별 가이드 카드의 기간 종류
enum MonthlyPeriodType {
  /// 확정일 기준 1개월 단위 기간
  regular(reservationSectionTitle: '이번 달까지 모인 돈으로 준비해요'),

  /// 여행까지 1개월 미만 남은 마지막 자투리 기간 (예산 목표 숨김)
  lessThanMonth(reservationSectionTitle: '여행 전까지 남은 준비를 마무리해요');

  const MonthlyPeriodType({required this.reservationSectionTitle});

  /// 준비 항목 섹션 제목
  final String reservationSectionTitle;

  /// 카드 타이틀
  /// [remainingMonths]: 현재 기간을 포함한 남은 1개월 단위 기간 수 (regular 전용)
  String title({int remainingMonths = 0}) => switch (this) {
        regular => '여행까지\n$remainingMonths개월 남았어요',
        lessThanMonth => '여행까지\n1달이 안 남았어요',
      };
}