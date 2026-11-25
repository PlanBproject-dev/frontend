// 붙여넣은 링크에서 예산에 맞는 코스 추출

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:plan_b/features/course/data/models/extracted_course.dart';
import 'package:plan_b/features/course/data/repositories/course_repository.dart';
import 'package:plan_b/shared/providers/selected_plan_id_provider.dart';

/// family 키: 링크 목록을 줄바꿈으로 이은 문자열
String extractedCoursesKeyOf(List<String> links) => links.join('\n');

final extractedCoursesProvider = FutureProvider.autoDispose
    .family<List<ExtractedCourse>, String>((ref, linksKey) async {
  final List<String> links =
      linksKey.split('\n').where((link) => link.isNotEmpty).toList();
  final String? planId = ref.watch(selectedPlanIdProvider);

  if (planId == null || links.isEmpty) return const [];

  final int? confirmedPlanId = int.tryParse(planId);
  // 숫자가 아니면 요청할 수 없으므로 오류로 처리 (추출 실패 안내 문구)
  if (confirmedPlanId == null) throw StateError('확정된 플랜 id가 아님: $planId');

  return ref.read(courseRepositoryProvider).extractCourses(confirmedPlanId, links);
});