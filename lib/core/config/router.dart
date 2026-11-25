// router.dart
// - routerProvider 하나로 GoRouter 생성
// - 글로벌 Shell과 로컬 Shell은 StatefulShellRoute.indexedStack으로 탭마다 화면 스택과 스크롤 위치를 유지.
// - 탭바가 없는 화면: 루트 내비게이터에 둬서 탭바를 덮음.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:plan_b/core/config/app_routes.dart';
import 'package:plan_b/core/config/shell/global_shell.dart';
import 'package:plan_b/core/config/shell/local_shell.dart';
import 'package:plan_b/features/course/presentation/pages/add_the_course_page.dart';
import 'package:plan_b/features/course/presentation/pages/course_page.dart';
import 'package:plan_b/features/course/presentation/pages/data_extraction_page.dart';
import 'package:plan_b/features/login/presentation/login.dart';
import 'package:plan_b/features/monthly_guide/presentation/monthly_guide_page.dart';
import 'package:plan_b/features/my_page/presentation/my_page.dart';
import 'package:plan_b/features/planner/presentation/planner_page.dart';
import 'package:plan_b/shared/providers/selected_plan_id_provider.dart';

import 'package:plan_b/features/home/presentation/home_page.dart';
import 'package:plan_b/core/config/pages/not_found_page.dart';
import 'package:plan_b/features/trip_check/presentation/pages/budget_first/budget_first_basic_info_page.dart';
import 'package:plan_b/features/trip_check/presentation/pages/budget_first/budget_first_budget_page.dart';
import 'package:plan_b/features/trip_check/presentation/pages/budget_first/budget_first_details_page.dart';
import 'package:plan_b/features/trip_check/presentation/pages/goal_first/goal_first_basic_info_page.dart';
import 'package:plan_b/features/trip_check/presentation/pages/goal_first/goal_first_details_page.dart';
import 'package:plan_b/features/trip_check/presentation/pages/goal_first/goal_first_food_budget_page.dart';
import 'package:plan_b/features/trip_check/presentation/pages/trip_analysis_page.dart';
import 'package:plan_b/features/trip_check/presentation/pages/trip_check_page.dart';
import 'package:plan_b/features/trip_check/presentation/pages/trip_type_page.dart';
import 'package:plan_b/features/trip_select/presentation/pages/trip_select_completed_page.dart';
import 'package:plan_b/features/trip_select/presentation/pages/trip_select_page.dart';
import 'package:plan_b/core/auth/auth_provider.dart';

// 탭바를 덮는 화면(local Shell, 전체 화면 라우트)이 올라가는 최상위 내비게이터
final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

final routerProvider = Provider<GoRouter>((ref) {
  // auth 상태가 바뀌면 GoRouter에게 "redirect 다시 계산해"라고 알리는 신호
  final authRefresh = ValueNotifier<AuthState>(ref.read(authProvider));
  ref.listen<AuthState>(authProvider, (_, next) => authRefresh.value = next);
  ref.onDispose(authRefresh.dispose);

  final router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: AppRoutes.home,
    refreshListenable: authRefresh,

    redirect: (context, state) {
      final location = state.matchedLocation;
      final auth = ref.read(authProvider);
      final isOnLogin = location == AppRoutes.login;

      // 로그인 안 됨 > 로그인 화면으로 (이미 로그인 화면이면 그대로)
      if (!auth.isLoggedIn) return isOnLogin ? null : AppRoutes.login;

      // 로그인 됨인데 로그인 화면에 있음 > 신규 회원은 온보딩, 기존 회원은 홈
      // 인트로가 스택 위치(canPop)로 온보딩을 추측하지 않도록 쿼리로 명시
      if (isOnLogin) {
        return auth.isNewUser
            ? Uri(
                path: AppRoutes.tripCheck,
                queryParameters: {AppRouteQueries.onboarding: 'true'},
              ).toString()
            : AppRoutes.home;
      }

      // '/'로 들어오면 홈으로 리다이렉트
      if (location == '/') return AppRoutes.home;

      // 선택된 플랜 없이 플랜 화면(/home/plan/...)에 들어오면 홈으로
      final isPlanRoute = location.startsWith('${AppRoutes.home}/plan');
      if (isPlanRoute && ref.read(selectedPlanIdProvider) == null) {
        return AppRoutes.home;
      }

      return null;
    },

    // 정의되지 않은 경로로 이동하면 안내 화면 표시
    errorBuilder: (context, state) => const NotFoundPage(),

    routes: [
      // 로그인 화면
      GoRoute(
        path: AppRoutes.login,
        builder: (context, state) => const LoginPage(),
      ),

      // 글로벌 Shell
      // 새 플랜 생성 탭은 브랜치가 아님 (MainShell에서 맞춤 여행 체크를 push)
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            GlobalShell(navigationShell: navigationShell),
        branches: [
          // 브랜치 0: 홈
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.home,
                builder: (context, state) => const HomePage(),
                routes: [
                  // 로컬 Shell
                  StatefulShellRoute.indexedStack(
                    parentNavigatorKey: _rootNavigatorKey,
                    builder: (context, state, navigationShell) =>
                        LocalShell(navigationShell: navigationShell),
                    branches: [
                      // 로컬 브랜치 0: 여행 플래너
                      StatefulShellBranch(
                        routes: [
                          GoRoute(
                            path: AppPaths.planner,
                            builder: (context, state) => const PlannerPage(),
                          ),
                        ],
                      ),
                      // 로컬 브랜치 1: 월별 여행 준비 가이드
                      StatefulShellBranch(
                        routes: [
                          GoRoute(
                            path: AppPaths.monthlyGuide,
                            builder: (context, state) =>
                                const MonthlyGuidePage(),
                          ),
                        ],
                      ),
                      // 로컬 브랜치 2: 여행 코스 플로우
                      StatefulShellBranch(
                        routes: [
                          GoRoute(
                            path: AppPaths.course,
                            builder: (context, state) =>
                                const CoursePage(),
                            routes: [
                              GoRoute(
                                path: AppPaths.courseAdd,
                                builder: (context, state) => const AddTheCoursePage(),
                                routes: [
                                  GoRoute(
                                    path: AppPaths.courseExtraction,
                                    builder: (context, state) => DataExtractionPage(
                                      links: state.extra is List<String> ? state.extra! as List<String> : const [],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),

          // 브랜치 1: 마이페이지
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.myPage,
                builder: (context, state) => const MyPage(),
              ),
            ],
          ),
        ],
      ),

      // 맞춤 여행 체크 (탭바 X)
      // 단계 이동은 push로 쌓음 (go를 쓰면 중간 단계가 스택에서 빠지므로)
      GoRoute(
        path: AppRoutes.tripCheck,
        builder: (context, state) => TripCheckPage(
          isOnboarding:
              state.uri.queryParameters[AppRouteQueries.onboarding] == 'true',
        ),
        routes: [
          GoRoute(
            path: AppPaths.tripType,
            builder: (context, state) => const TripTypePage(),
          ),
          GoRoute(
            path: AppPaths.budgetFirstBasicInfo,
            builder: (context, state) => BudgetFirstBasicInfoPage(
              // 여행 고르기에서 돌아온 경우: 선택한 기준 플로우 안내하는 토스트 생략
              showGuideToast: state.extra != AppRouteExtras.reselect,
            ),
          ),
          GoRoute(
            path: AppPaths.budgetFirstBudget,
            builder: (context, state) => const BudgetFirstBudgetPage(),
          ),
          GoRoute(
            path: AppPaths.budgetFirstDetails,
            builder: (context, state) => const BudgetFirstDetailsPage(),
          ),
          GoRoute(
            path: AppPaths.goalFirstBasicInfo,
            builder: (context, state) => GoalFirstBasicInfoPage(
              // 여행 고르기에서 돌아온 경우: 선택한 기준 플로우 안내하는 토스트 생략
              showGuideToast: state.extra != AppRouteExtras.reselect,
            ),
          ),
          GoRoute(
            path: AppPaths.goalFirstDetails,
            builder: (context, state) => const GoalFirstDetailsPage(),
          ),
          GoRoute(
            path: AppPaths.goalFirstFoodBudget,
            builder: (context, state) => const GoalFirstFoodBudgetPage(),
          ),
          GoRoute(
            path: AppPaths.tripAnalysis,
            builder: (context, state) => const TripAnalysisPage(),
          ),
        ],
      ),

      // 여행 고르기 (탭바 X)
      GoRoute(
        path: AppRoutes.tripSelect,
        builder: (context, state) => const TripSelectPage(),
        routes: [
          GoRoute(
            path: AppPaths.completed,
            builder: (context, state) => TripSelectCompletedPage(
              recommendationId: state.extra as String?, // 여행 고르기에서 선택한 추천 id
            ),
          ),
        ],
      ),
    ],
  );

  ref.onDispose(router.dispose);

  return router;
});