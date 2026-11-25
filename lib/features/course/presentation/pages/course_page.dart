// 나의 여행 코스 페이지

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:plan_b/core/config/app_routes.dart';
import 'package:plan_b/core/theme/app_colors.dart';
import 'package:plan_b/core/theme/app_text_styles.dart';
import 'package:plan_b/features/course/data/models/daily_course.dart';
import 'package:plan_b/features/course/presentation/providers/my_course_provider.dart';
import 'package:plan_b/features/course/presentation/widgets/my_course_list.dart';
import 'package:plan_b/shared/providers/selected_plan_id_provider.dart';
import 'package:plan_b/shared/widgets/background/bg_bottom_ellipse.dart';
import 'package:plan_b/shared/widgets/background/bg_top_gradient.dart';
import 'package:plan_b/shared/widgets/btn/btn.dart';
import 'package:plan_b/features/course/presentation/widgets/my_course_list_skeleton.dart';
import 'package:plan_b/shared/widgets/nav/top_app_bar.dart';

class CoursePage extends ConsumerWidget {
  const CoursePage({super.key});

  static const double _contentTopGap = 16;    // 상단바 ~ 안내 문구 간격
  static const double _contentBottomGap = 24; // 마지막 카드 ~ 로컬 탭바 간격

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 선택을 해제한 직후 화면을 벗어나기 전 한 번 더 그려질 수 있어 null 처리 (플래너와 동일)
    final String? planId = ref.watch(selectedPlanIdProvider);

    return Scaffold(
      backgroundColor: AppColors.blue100,
      extendBodyBehindAppBar: true, // 배경 그라데이션이 상단바 뒤까지 깔리도록
      appBar: TopAppBar(
        title: '나의 여행 코스',
        // 여행 코스는 local shell 탭의 첫 화면이라 기본 pop으로 나가지 못하므로 홈으로 직접 이동
        onBack: () => context.go(AppRoutes.home),
      ),
      body: Builder(
        builder: (context) {
          // top: 상태바 + 상단바 / bottom: 로컬 탭바 + 홈 인디케이터 (LocalShell extendBody)
          final EdgeInsets inset = MediaQuery.paddingOf(context);

          return Stack(
            fit: StackFit.expand,
            children: [
              const BgBottomEllipse(),
              const BgTopGradient(),

              // 콘텐츠: 상단바 아래에서 시작, 스크롤하면 상단바 경계에서 잘림 / 로컬 탭바 뒤로는 지나감
              Positioned(
                top: inset.top,
                left: 0,
                right: 0,
                bottom: 0,
                child: SingleChildScrollView(
                  clipBehavior: Clip.hardEdge,
                  padding: EdgeInsets.fromLTRB(
                    24,
                    _contentTopGap,
                    24,
                    inset.bottom + _contentBottomGap,
                  ),
                  child: planId == null
                      ? const SizedBox.shrink()
                      : _CourseContent(planId: planId),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

/// 안내 문구 + 웹에서 찾은 코스 추가하기 버튼 + 일일 코스 목록
class _CourseContent extends ConsumerWidget {
  const _CourseContent({required this.planId});

  final String planId;

  static const String _intro = '나의 여행 플랜에 맞춰 생성한 여행 코스예요.\n'
      '이동 거리가 가까운 장소끼리 조합해\n'
      '하루 동안 둘러보기 좋은 그룹 코스를 추천해 드려요.';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<DailyCourse>> asyncCourses =
        ref.watch(myCourseProvider(planId));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: 24, // 안내 문구 ~ 버튼 간격
      children: [
        Text(
          _intro,
          style: AppTextStyles.labelMedium12.copyWith(color: AppColors.gray500),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 20, // 버튼 ~ 코스 목록 간격
          children: [
            Btn(
              text: '웹에서 찾은 코스 추가하기',
              variant: BtnVariant.primary,
              iconPosition: BtnIconPosition.trailing,
              onPressed: () => context.go(AppRoutes.courseAdd),
            ),
            asyncCourses.when(
              loading: () => const MyCourseListSkeleton(),
              error: (_, _) => Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Text(
                  '여행 코스를 불러오지 못했어요.',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.bodyMedium16.copyWith(color: AppColors.gray400),
                ),
              ),
              data: (courses) => MyCourseList(courses: courses),
            ),
          ],
        ),
      ],
    );
  }
}