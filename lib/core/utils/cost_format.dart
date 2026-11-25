// 금액(원) 표시 문구 공통 규칙
// - 금액 없음(null): '비용 알 수 없음'
// - 0원: '무료'
// - 0원 초과 ~ 1만원 이하: '1만원 이하'
// - 그 외: '약 N만원' (만원 단위 반올림)

abstract final class CostFormat {
  static const int tenThousand = 10000;

  static const String unknown = '비용 알 수 없음';
  static const String free = '무료';
  static const String underTenThousand = '1만원 이하';

  /// 원 -> 만원 (반올림)
  static int toManwon(num won) => (won / tenThousand).round();

  /// 금액 하나
  static String single(num? won) {
    if (won == null) return unknown;
    if (won == 0) return free;
    if (won <= tenThousand) return underTenThousand;
    return '약 ${toManwon(won)}만원';
  }

  /// 금액 범위 (최소 ~ 최대)
  /// - 하나만 있거나 둘이 같으면: single 규칙
  /// - 최대가 1만원 이하: '1만원 이하'
  /// - 최소가 1만원 이하(0원 포함): 'N만원 이하' (최대 기준)
  /// - 만원 단위로 반올림해서 같아지면: '약 N만원'
  /// - 그 외: 'N-M만원'
  static String range(num? low, num? high) {
    if (low == null || high == null || low == high) return single(low ?? high);

    final num min = low < high ? low : high;
    final num max = low < high ? high : low;

    if (max <= tenThousand) return underTenThousand;
    if (min <= tenThousand) return '${toManwon(max)}만원 이하';

    final int minManwon = toManwon(min);
    final int maxManwon = toManwon(max);
    if (minManwon == maxManwon) return '약 $minManwon만원';
    return '$minManwon-$maxManwon만원';
  }

  /// 코스 카드 하단 예상 비용 문구 ('예상 비용 약 3만원' / '예상 비용 무료' / '예상 비용 알 수 없음')
  static String estimated(num? won) =>
      won == null ? '예상 비용 알 수 없음' : '예상 비용 ${single(won)}';
}