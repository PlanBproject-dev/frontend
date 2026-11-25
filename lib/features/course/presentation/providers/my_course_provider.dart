// 플랜 id로 나의 여행 코스(일일 코스 목록) 조회 + 웹에서 찾은 코스 추가

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:plan_b/features/course/data/models/daily_course.dart';
import 'package:plan_b/features/course/data/models/extracted_course.dart';
import 'package:plan_b/features/course/data/repositories/course_repository.dart';

class MyCourseNotifier
    extends AutoDisposeFamilyAsyncNotifier<List<DailyCourse>, String> {
  @override
  Future<List<DailyCourse>> build(String planId) async {
    final int? confirmedPlanId = int.tryParse(planId);
    // 숫자가 아니면 조회할 수 없으므로 오류로 처리 (페이지 에러 UI)
    if (confirmedPlanId == null) throw StateError('확정된 플랜 id가 아님: $planId');

    final List<DailyCourse> courses =
        await ref.read(courseRepositoryProvider).getMyCourses(confirmedPlanId);
    return _sortByCost(courses);
  }

  /// 추출된 코스를 내 플랜에 추가 (코스 정보 추출 화면의 '+' 버튼)
  Future<void> addExtractedCourse(ExtractedCourse course) async {
    final int? confirmedPlanId = int.tryParse(arg);
    if (confirmedPlanId == null) throw StateError('확정된 플랜 id가 아님: $arg');

    // 요청하는 동안에는 구독하는 화면이 없어져도 provider가 정리되지 않도록 유지
    final KeepAliveLink keepAlive = ref.keepAlive();
    try {
      final CourseRepository repository = ref.read(courseRepositoryProvider);

      await repository.addLinkedCourses(
        confirmedPlanId,
        extractId: course.extractId,
        indexes: [course.index],
      );

      // 추가 성공 > 서버에 반영된 실제 목록으로 갱신
      final List<DailyCourse> updated =
          await repository.getMyCourses(confirmedPlanId);
      state = AsyncData(_sortByCost(updated));
    } finally {
      keepAlive.close();
    }
  }

  /// 일일 코스 정렬: 예상 비용이 낮은 순서 (비용을 알 수 없는 코스는 맨 뒤)
  static List<DailyCourse> _sortByCost(List<DailyCourse> courses) =>
      List.of(courses)..sort(_compareCost);

  static int _compareCost(DailyCourse a, DailyCourse b) {
    final int? x = a.estimatedCost;
    final int? y = b.estimatedCost;
    if (x == null && y == null) return 0;
    if (x == null) return 1;
    if (y == null) return -1;
    return x.compareTo(y);
  }
}

final myCourseProvider = AsyncNotifierProvider.autoDispose
    .family<MyCourseNotifier, List<DailyCourse>, String>(MyCourseNotifier.new);