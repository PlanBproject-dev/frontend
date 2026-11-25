import 'package:json_annotation/json_annotation.dart';

/// 서버 여행지 enum (서버: NHA_TRANG <-> 앱: nhaTrang 자동 변환)
@JsonEnum(fieldRename: FieldRename.screamingSnake)
enum Destination {
  tokyo('도쿄'),
  fukuoka('후쿠오카'),
  osaka('오사카'),
  sapporo('삿포로'),
  danang('다낭'),
  nhaTrang('나트랑'),
  hanoi('하노이'),
  paris('파리'),
  barcelona('바르셀로나'),
  prague('프라하'),
  shanghai('상하이'),
  beijing('베이징'),
  chongqing('충칭'),
  la('LA'),
  newYork('뉴욕'),
  hawaii('하와이'),
  hongKong('홍콩'),
  taiwan('대만');

  const Destination(this.label);
  final String label; // 화면에 보여줄 한글 이름
}