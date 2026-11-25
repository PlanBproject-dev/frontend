// PATCH /api/v1/user/nickname 요청 body

class NicknameUpdateRequestDto {
  const NicknameUpdateRequestDto({required this.nickname});

  final String nickname;

  static const int maxLength = 10;  // 최대 10자 제한.

  // 완성형 한글 + 일반 공백(' ')만 허용, 공백으로 시작 X, 연속 공백 X
  // (\s는 탭·줄바꿈까지 포함하므로 사용하지 않음)
  static final RegExp _pattern = RegExp(r'^(?! )(?!.* {2})[가-힣 ]+$');
  static final RegExp _consecutiveSpaces = RegExp(r' {2,}');

  /// 서버로 보내기 전 검사 (문제 없으면 null, 있으면 사용자에게 보여줄 메시지 노출)
  static String? validate(String nickname) {
    if (nickname.isEmpty) return '닉네임을 입력해주세요';
    if (nickname.length > maxLength) return '닉네임은 $maxLength자 이하로 입력해주세요';
    if (_consecutiveSpaces.hasMatch(nickname)) return '연속으로 공백을 입력할 수 없어요';
    if (!_pattern.hasMatch(nickname)) return '닉네임은 한글과 공백 1번만 입력할 수 있어요';
    return null;
  }

  Map<String, dynamic> toJson() => {'nickname': nickname};
}