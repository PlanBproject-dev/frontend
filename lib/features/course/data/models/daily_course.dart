// 나의 여행 코스 데이터 모델

import 'package:plan_b/core/utils/cost_format.dart';

/// 일일 코스 안의 개별 코스 항목(장소)
class CoursePlace {
  const CoursePlace({
    required this.title,
    required this.caption,
    this.isAdded = false,
  });

  final String title;
  final String caption;
  final bool isAdded;   // 웹에서 찾은 코스가 기존 일일 코스에 추가된 장소인지
}

/// 일일 코스: 이동 거리가 가까운 장소끼리 묶은, 하루 동안 둘러보기 좋은 그룹 코스
class DailyCourse {
  const DailyCourse({
    required this.id,
    required this.places,
    required this.estimatedCost,
    this.isNew = false,
  });

  final String id;
  final List<CoursePlace> places;
  final int? estimatedCost; // 코스 항목별 예상 비용 합계 (원, 서버가 안 주면 null) - 정렬 기준
  final bool isNew;        // 웹에서 찾은 코스로 새로 생긴 일일 코스인지

  /// 카드 하단 예상 비용 문구
  String get budgetLabel => CostFormat.estimated(estimatedCost);
}