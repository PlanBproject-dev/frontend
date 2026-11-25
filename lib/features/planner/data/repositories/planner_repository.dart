import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:plan_b/core/network/api_request.dart';
import 'package:plan_b/core/network/dio_provider.dart';
import 'package:plan_b/features/planner/data/models/dto/confirmed_plan_detail_response_dto.dart';
import 'package:plan_b/features/planner/data/models/planner_trip_plan.dart';

class PlannerRepository {
  PlannerRepository(this._dio);
  final Dio _dio;

  /// 확정된 플랜 상세 조회 (나의 여행 플래너)
  Future<PlannerTripPlan> getConfirmedPlan(int confirmedPlanId) {
    return apiRequest(
      () => _dio.get('/api/v1/plans/confirm/$confirmedPlanId'),
      (data) => ConfirmedPlanDetailResponseDto.fromJson(data as Map<String, dynamic>)
          .toPlannerTripPlan(),
    );
  }
}

final plannerRepositoryProvider =
    Provider((ref) => PlannerRepository(ref.read(dioProvider)));