// app_routes.dart : 라우트 경로 상수 관리.
// - AppRoutes: 화면 이동(context.go / push)에 쓰는 전체 경로
// - AppPaths: router.dart에서 하위 라우트를 정의할 때만 쓰는 경로 조각

abstract final class AppRoutes {
  // 서비스 진입 (탭바 없음)
  static const String splash = '/splash';
  static const String login = '/login';

  // global_tab 사용
  static const String home = '/home';
  static const String myPage = '/my-page';

  // local_tab 사용 (home의 하위 페이지들)
  static const String planner = '$home/${AppPaths.planner}';
  static const String monthlyGuide = '$home/${AppPaths.monthlyGuide}';
  static const String course = '$home/${AppPaths.course}';
  static const String courseAdd = '$course/${AppPaths.courseAdd}';
  static const String courseExtraction = '$courseAdd/${AppPaths.courseExtraction}';

  // 맞춤 여행 체크 (탭바 없음)
  static const String tripCheck = '/trip-check';
  static const String tripType = '$tripCheck/${AppPaths.tripType}';

  // 맞춤 여행 체크 : budget-first 플로우 화면 3개
  static const String budgetFirstBasicInfo = '$tripCheck/${AppPaths.budgetFirstBasicInfo}';
  static const String budgetFirstBudget = '$tripCheck/${AppPaths.budgetFirstBudget}';
  static const String budgetFirstDetails = '$tripCheck/${AppPaths.budgetFirstDetails}';

  // 맞춤 여행 체크 : goal-first 플로우 화면 3개
  static const String goalFirstBasicInfo = '$tripCheck/${AppPaths.goalFirstBasicInfo}';
  static const String goalFirstDetails = '$tripCheck/${AppPaths.goalFirstDetails}';
  static const String goalFirstFoodBudget = '$tripCheck/${AppPaths.goalFirstFoodBudget}';

  // 여행 계획 분석 (분석 중 / 분석 완료)
  static const String tripAnalysis = '$tripCheck/${AppPaths.tripAnalysis}';

  // 여행 고르기 (탭바 없음)
  static const String tripSelect = '/trip-select';
  static const String tripSelectCompleted = '$tripSelect/${AppPaths.completed}';
}

abstract final class AppPaths {
  // 나의 여행 플래너 ('/home' 기준)
  static const String planner = 'plan/planner';
  static const String monthlyGuide = 'plan/monthly-guide';
  static const String course = 'plan/course';
  static const String courseAdd = 'add'; // course 기준
  static const String courseExtraction = 'extraction'; // courseAdd 기준

  // 맞춤 여행 체크 ('/trip-check' 기준)
  static const String tripType = 'type';
  static const String budgetFirstBasicInfo = 'budget-first/basic-info';
  static const String budgetFirstBudget = 'budget-first/budget';
  static const String budgetFirstDetails = 'budget-first/details';
  static const String goalFirstBasicInfo = 'goal-first/basic-info';
  static const String goalFirstDetails = 'goal-first/details';
  static const String goalFirstFoodBudget = 'goal-first/food-budget';
  static const String tripAnalysis = 'analysis';

  // 여행 고르기 ('/trip-select' 기준)
  static const String completed = 'completed';
}