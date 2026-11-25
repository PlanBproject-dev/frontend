import 'package:flutter/widgets.dart';

extension KeepWordWrap on String {
  /// 띄어쓰기 단위로만 줄바꿈되도록 변환 (한글이 단어 중간에서 잘리지 않게)
  /// - 단어 안 글자 사이에 Word Joiner(\u2060, 화면에 안 보임)를 넣어 그 사이에서는 줄바꿈 금지
  /// - 한 단어가 한 줄보다 길면 그 단어는 어쩔 수 없이 중간에서 잘림
  String get keepWord => splitMapJoin(
        ' ',
        onMatch: (_) => ' ',
        onNonMatch: (word) => word.characters.join('\u2060'),
      );
}