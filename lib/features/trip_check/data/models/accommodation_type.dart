/// 선호하는 숙소 유형 (최대 2개 선택)
enum AccommodationType {
  hotel('호텔'),
  hostel('호스텔'),
  pension('펜션'),
  poolVilla('풀빌라'),
  resort('리조트');

  const AccommodationType(this.label);

  final String label;

  static const int maxSelection = 2; // 최대 선택 개수
}