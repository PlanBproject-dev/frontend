// POST /api/v1/plans/confirm/{confirmedPlanId}/courses

class LinkCourseSaveRequestDto {
  const LinkCourseSaveRequestDto({
    required this.extractId,
    required this.indexes,
  });

  final String extractId;   // 코스 후보 추출 응답의 extractId
  final List<int> indexes;  // 추가할 후보들의 index

  Map<String, dynamic> toJson() => {
        'extractId': extractId,
        'indexes': indexes,
      };
}