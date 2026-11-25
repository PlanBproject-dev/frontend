import 'package:plan_b/features/course/data/models/course_category.dart';
import 'package:plan_b/core/utils/cost_format.dart';

/// 웹 링크에서 추출한 코스 정보
class ExtractedCourse {
  const ExtractedCourse({
    required this.id,
    required this.extractId,
    required this.index,
    required this.category,
    required this.title,
    required this.caption,
    required this.sourceUrl,
    required this.estimatedCost,
  });

  final String id;
  final String extractId;
  final int index;
  final CourseCategory category;
  final String title;
  final String caption;
  final String sourceUrl;
  final int? estimatedCost;

  /// 카드 하단 예상 비용 문구
  String get budgetLabel => CostFormat.estimated(estimatedCost);
}