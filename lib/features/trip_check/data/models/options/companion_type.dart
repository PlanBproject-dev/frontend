/// 여행 구성원 유형 (selection_chip_group에 표시되는 순서대로)
enum CompanionType {
  solo('나홀로'),
  family('가족'),
  friends('친구'),
  couple('연인'),
  business('비즈니스/업무'),
  group('그룹/패키지');

  const CompanionType(this.label);

  final String label; // 칩에 표시되는 텍스트
}