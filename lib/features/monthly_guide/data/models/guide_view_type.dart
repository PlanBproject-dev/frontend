/// 월별 여행 준비 화면의 보기 종류
enum GuideViewType {
  /// 전체 일정을 한 줄로 보는 타임라인 보기
  timeline(label: '전체 타임라인'),

  /// 월 단위로 나눠 보는 가이드 보기
  monthlyGuide(label: '월별 가이드');

  const GuideViewType({required this.label});

  final String label; // 전환 버튼에 표시되는 문구

  /// 버튼을 눌렀을 때 바뀔 반대쪽 보기
  GuideViewType get toggled =>
      this == timeline ? monthlyGuide : timeline;
}