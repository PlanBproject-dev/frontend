// 코스 추출 실패 사유
// - 저장소에서 서버 응답을 사유로 바꿔 던지고, 화면은 사유별로 안내 토스트를 띄운다.

/// 실패 사유
enum CourseExtractionFailure {
  noCourseFound,   // 링크에서 추가할 수 있는 코스를 찾지 못함
  unsupportedLink, // 지원하지 않는 링크
  unknown,         // 그 외 (네트워크, 서버 오류 등)
}

/// 코스 추출 실패 예외
class CourseExtractionException implements Exception {
  const CourseExtractionException(this.failure);

  final CourseExtractionFailure failure;

  @override
  String toString() => 'CourseExtractionException(${failure.name})';
}