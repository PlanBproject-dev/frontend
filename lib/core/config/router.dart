import 'package:go_router/go_router.dart';
import 'package:plan_b/features/home/presentation/home_page.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [GoRoute(path: '/', builder: (context, state) => const HomePage())],
);
