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
import 'package:plan_b/shared/providers/selected_plan_id_provider.dart';

import 'package:plan_b/features/home/presentation/home_page.dart';
import 'package:plan_b/core/config/pages/not_found_page.dart';
import 'package:plan_b/core/config/pages/todo_page.dart';
import 'package:plan_b/features/trip_check/presentation/pages/budget_first_basic_info_page.dart';
import 'package:plan_b/features/trip_check/presentation/pages/budget_first_budget_page.dart';
import 'package:plan_b/features/trip_check/presentation/pages/budget_first_details_page.dart';
import 'package:plan_b/features/trip_check/presentation/pages/goal_first_basic_info_page.dart';
import 'package:plan_b/features/trip_check/presentation/pages/goal_first_details_page.dart';
import 'package:plan_b/features/trip_check/presentation/pages/goal_first_food_budget_page.dart';
import 'package:plan_b/features/trip_check/presentation/pages/trip_analysis_page.dart';
import 'package:plan_b/features/trip_check/presentation/pages/trip_check_page.dart';
import 'package:plan_b/features/trip_check/presentation/pages/trip_type_page.dart';
import 'package:plan_b/features/trip_select/presentation/pages/trip_select_completed_page.dart';
import 'package:plan_b/features/trip_select/presentation/pages/trip_select_page.dart';

// 탭바를 덮는 화면(local Shell, 전체 화면 라우트)이 올라가는 최상위 내비게이터
final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

final routerProvider = Provider<GoRouter>((ref) {
  final router = GoRouter(
    navigatorKey: _rootNavigatorKey,

    // TODO
    // 나중에 로그인 연동할 때 스플래시로 바꾸고 로그인 상태에 따른 redirect 추가 필요함
    initialLocation: AppRoutes.tripCheck,

    redirect: (context, state) {
      final location = state.matchedLocation;

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
      // 서비스 진입 화면 (로그인 구현 전까지는 직접 이동할 때만 사용)
      GoRoute(
        path: AppRoutes.splash,
        builder: (context, state) => const TodoPage('스플래시'),
      ),
      GoRoute(
        path: AppRoutes.login,
        builder: (context, state) => const TodoPage('로그인'),
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
                            builder: (context, state) =>
                                const TodoPage('여행 플래너'),
                          ),
                        ],
                      ),
                      // 로컬 브랜치 1: 월별 여행 준비 가이드
                      StatefulShellBranch(
                        routes: [
                          GoRoute(
                            path: AppPaths.monthlyGuide,
                            builder: (context, state) =>
                                const TodoPage('월별 여행 준비'),
                          ),
                        ],
                      ),
                      // 로컬 브랜치 2: 여행 코스 플로우
                      StatefulShellBranch(
                        routes: [
                          GoRoute(
                            path: AppPaths.course,
                            builder: (context, state) =>
                                const TodoPage('여행 코스'),
                            routes: [
                              GoRoute(
                                path: AppPaths.courseAdd,
                                builder: (context, state) =>
                                    const TodoPage('코스 추가'),
                                routes: [
                                  GoRoute(
                                    path: AppPaths.courseExtraction,
                                    builder: (context, state) =>
                                        const TodoPage('코스 정보 추출'),
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
                builder: (context, state) => const TodoPage('마이페이지'),
              ),
            ],
          ),
        ],
      ),

      // 맞춤 여행 체크 (탭바 X)
      // 단계 이동은 push로 쌓음 (go를 쓰면 중간 단계가 스택에서 빠지므로)
      GoRoute(
        path: AppRoutes.tripCheck,
        builder: (context, state) => const TripCheckPage(),
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
              planId: state.extra as String?, // 여행 고르기에서 선택한 플랜 id
            ),
          ),
        ],
      ),
    ],
  );

  ref.onDispose(router.dispose);

  return router;
});