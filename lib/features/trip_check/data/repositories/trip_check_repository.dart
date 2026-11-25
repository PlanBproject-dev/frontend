import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:plan_b/core/network/api_request.dart';
import 'package:plan_b/core/network/dio_provider.dart';
import 'package:plan_b/features/trip_check/data/models/dto/wallet_plan_request_dto.dart';
import 'package:plan_b/features/trip_check/data/models/dto/wallet_plan_response_dto.dart';
import 'package:plan_b/features/trip_check/data/models/dto/goal_plan_request_dto.dart';
import 'package:plan_b/features/trip_check/data/models/dto/goal_plan_response_dto.dart';

class TripCheckRepository {
  TripCheckRepository(this._dio);
  final Dio _dio;

  /// 지갑 기준 플랜 생성 (플로우에서 첫 임시저장)
  Future<WalletPlanResponseDto> createWalletPlan(WalletPlanRequestDto request) {
    return apiRequest(
      () => _dio.post('/api/v1/plans/wallet', data: request.toJson()),
      (data) => WalletPlanResponseDto.fromJson(data as Map<String, dynamic>),
    );
  }

  /// 지갑 기준 플랜 수정
  Future<WalletPlanResponseDto> updateWalletPlan(
    int planId,
    WalletPlanRequestDto request,
  ) {
    return apiRequest(
      () => _dio.patch('/api/v1/plans/wallet/$planId', data: request.toJson()),
      (data) => WalletPlanResponseDto.fromJson(data as Map<String, dynamic>),
    );
  }

  /// 목표 기준 플랜 생성 (플로우에서 첫 임시저장)
  Future<GoalPlanResponseDto> createGoalPlan(GoalPlanRequestDto request) {
    return apiRequest(
      () => _dio.post('/api/v1/plans/goal', data: request.toJson()),
      (data) => GoalPlanResponseDto.fromJson(data as Map<String, dynamic>),
    );
  }

  /// 목표 기준 플랜 수정
  Future<GoalPlanResponseDto> updateGoalPlan(
    int planId,
    GoalPlanRequestDto request,
  ) {
    return apiRequest(
      () => _dio.patch('/api/v1/plans/goal/$planId', data: request.toJson()),
      (data) => GoalPlanResponseDto.fromJson(data as Map<String, dynamic>),
    );
  }
}

final tripCheckRepositoryProvider =
    Provider((ref) => TripCheckRepository(ref.read(dioProvider)));