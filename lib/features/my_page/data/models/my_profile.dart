// 마이페이지에 표시할 사용자 프로필
// API 스펙 확정 전이라 UI 기준으로만 구조화함

class MyProfile {
  const MyProfile({
    required this.name,
    required this.email,
  });

  final String name;
  final String email;

  MyProfile copyWith({String? name, String? email}) {
    return MyProfile(
      name: name ?? this.name,
      email: email ?? this.email,
    );
  }
}