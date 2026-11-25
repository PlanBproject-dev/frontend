/// 전체 타임라인에서 할 일이 속한 기간
enum TimelinePeriodStatus {
  previous, /// 지난 기간 (완료된 항목만 표시)
  present,  /// 이번 기간
  upcoming, /// 다가올 기간 (미완료 항목만 표시)
}