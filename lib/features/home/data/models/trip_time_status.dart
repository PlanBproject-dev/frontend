/// 오늘 기준 여행 플랜의 시점 상태
enum TripTimeStatus {
  upcoming, // 여행 시작 전 → 플랜 카드 + 디데이 태그(D-n)
  ongoing,  // 시작일 ~ 종료일 사이 → 플랜 카드 대신 진행중인 여행 카드(D-Day / D+n)
  past,     // 종료일이 지남 → 플랜 카드, 디데이 태그 없음
}