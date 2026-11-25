/// 나의 여행 스타일
enum TravelStyle {
  activity('액티비티_중심'),
  scenery('풍경_감상'),
  landmark('명소_방문'),
  food('먹방_투어'),
  relaxation('휴양_중심'),
  artCulture('예술문화_체험');

  const TravelStyle(this.label);

  final String label;

  static const int maxSelection = 3; // 최대 선택 개수
}