// POST /api/v1/plans/confirm/{confirmedPlanId}/contents/extract

class LinkExtractRequestDto {
  const LinkExtractRequestDto({required this.urls});

  final List<String> urls; // 코스 추가 화면에서 입력한 링크 (형식, 중복 검사 완료)

  Map<String, dynamic> toJson() => {'urls': urls};
}