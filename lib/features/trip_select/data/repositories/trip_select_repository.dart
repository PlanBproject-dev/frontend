import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:plan_b/core/network/api_request.dart';
import 'package:plan_b/core/network/dio_provider.dart';
import 'package:plan_b/features/trip_select/data/models/dto/plan_detail_response_dto.dart';
import 'package:plan_b/features/trip_select/data/models/trip_basic_info.dart';
import 'package:plan_b/features/trip_select/data/models/dto/recommendation_response_dto.dart';
import 'package:plan_b/features/trip_select/data/models/trip_plan.dart';
import 'package:plan_b/features/trip_select/data/models/budget_level.dart';

class TripSelectRepository {
  TripSelectRepository(this._dio);
  final Dio _dio;

  /// 추천 생성 상태 조회 간격
  static const Duration _pollInterval = Duration(seconds: 3);

  /// 추천 생성을 최대로 기다리는 시간 (넘으면 실패 처리)
  static const Duration _maxGenerationWait = Duration(minutes: 10);

  /// 플랜 기본 정보 조회 (여행 고르기 상단의 여행 기본 정보 섹션)
  Future<TripBasicInfo> getPlanBasicInfo(int planId) {
    return apiRequest(
      () => _dio.get('/api/v1/plans/$planId'),
      (data) => PlanDetailResponseDto.fromJson(data as Map<String, dynamic>)
          .toTripBasicInfo(),
    );
  }

  /// 지갑 기준 AI 여행지 추천 생성 (1~3순위)
  /// 생성 접수 후 완료될 때까지 상태를 조회해서 결과 반환
  Future<List<TripPlan>> createWalletRecommendations(int planId) async {
    final res = await _requestRecommendations('/api/v1/plans/$planId/recommendations/wallet');
    return res.toWalletTripPlans();
  }

  /// 지갑 기준 추천 여행지 추가 조회 (4~6순위)
  /// - 1~3순위 생성 때 서버가 함께 만들어 둔 결과를 조회하는 것이므로, 기본 응답 대기 시간 60초 사용.
  Future<List<TripPlan>> getMoreWalletRecommendations(int planId) {
    return apiRequest(
      () => _dio.get('/api/v1/plans/$planId/recommendations/wallet/more'),
      (data) => RecommendationResponseDto.fromJson(data as Map<String, dynamic>)
          .toWalletTripPlans(),
    );
  }

  /// 목표 기준 AI 예산 추천 생성 (고/중/저 3단계)
  /// 생성 접수 후 완료될 때까지 상태를 조회해서 결과 반환
  Future<List<BudgetLevelPlan>> createGoalRecommendations(int planId) async {
    final res = await _requestRecommendations('/api/v1/plans/$planId/recommendations/goal');
    return res.toGoalBudgetPlans();
  }

  /// 추천 생성 비동기 처리 (지갑/목표 공통)
  /// 1. POST: 생성 접수 (이미 생성돼 있으면 바로 DONE + 결과)
  /// 2. PENDING이면 _pollInterval마다 GET으로 상태 조회
  /// 3. DONE: 결과 반환 / FAILED, 모르는 상태값, _maxGenerationWait 초과: ApiException
  /// (POST는 같은 플랜에 다시 보내도 중복 생성되지 않으므로, 실패 후 재시도해도 안전함)
  Future<RecommendationResponseDto> _requestRecommendations(String path) async {
    RecommendationResponseDto parse(dynamic data) =>
        RecommendationResponseDto.fromJson(data as Map<String, dynamic>);

    var res = await apiRequest(() => _dio.post(path), parse);

    final deadline = DateTime.now().add(_maxGenerationWait);
    while (res.status == RecommendationStatus.pending) {
      if (DateTime.now().isAfter(deadline)) {
        throw ApiException('추천 생성이 오래 걸리고 있어요. 잠시 후 다시 시도해 주세요.');
      }
      await Future<void>.delayed(_pollInterval);
      res = await apiRequest(() => _dio.get(path), parse);
    }

    if (res.status != RecommendationStatus.done) {
      throw ApiException('추천 생성에 실패했어요.'); // FAILED 또는 모르는 상태값
    }
    return res;
  }

  /// 추천 계획 결정 (지갑/목표 기준 공통)
  /// - planId: 맞춤 여행 체크에서 만든 플랜 id
  /// - recommendationId: 여행 고르기에서 선택한 티켓/영수증 id
  /// - 반환: 확정된 플랜 id (confirmedPlanId)
  Future<int> confirmPlan({
    required int planId,
    required int recommendationId,
  }) {
    return apiRequest(
      () => _dio.post(
        '/api/v1/plans/$planId/confirm',
        data: {'recommendationId': recommendationId},
      ),
      (data) => (data as num).toInt(),
    );
  }
}

final tripSelectRepositoryProvider =
    Provider((ref) => TripSelectRepository(ref.read(dioProvider)));