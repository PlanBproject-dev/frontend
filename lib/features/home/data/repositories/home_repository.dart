import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:plan_b/core/network/api_request.dart';
import 'package:plan_b/core/network/dio_provider.dart';
import 'package:plan_b/features/home/data/models/dto/plan_list_response_dto.dart';
import 'package:plan_b/features/home/data/models/trip_plan_summary.dart';

class HomeRepository {
  HomeRepository(this._dio);
  final Dio _dio;

  /// 나의 여행 플랜 목록 (화면용 모델로 변환해서 반환)
  Future<List<TripPlanSummary>> getMyPlans() {
    return apiRequest(
      () => _dio.get('/api/v1/plans/list'),
      (data) => PlanListResponseDto.fromJson(data as Map<String, dynamic>)
          .toTripPlanSummaries(),
    );
  }
}

final homeRepositoryProvider =
    Provider((ref) => HomeRepository(ref.read(dioProvider)));