import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:plan_b/core/auth/auth_provider.dart';

import 'package:plan_b/features/home/data/models/trip_plan_summary.dart';
import 'package:plan_b/features/home/data/repositories/home_repository.dart';

final homePlansProvider = FutureProvider<List<TripPlanSummary>>((ref) {
  // 로그인 상태가 바뀌면 이 provider가 다시 실행됨
  final isLoggedIn = ref.watch(authProvider.select((auth) => auth.isLoggedIn));
  if (!isLoggedIn) return const [];
  
  return ref.read(homeRepositoryProvider).getMyPlans();
});