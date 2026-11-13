/// 선호하는 항공권 유형
enum FlightPreference {
  airline('주요 항공만', '저가 항공도 가능'),
  route('직항', '경유도 가능'),
  tripWay('왕복', '편도');

  const FlightPreference(this.leftLabel, this.rightLabel);

  final String leftLabel;
  final String rightLabel;
}