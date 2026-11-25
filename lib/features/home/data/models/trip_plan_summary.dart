// 홈 화면 여행 플랜 카드(trip_plan_thumbnail_card)에 표시할 데이터

import 'package:flutter/material.dart' show DateTimeRange;

import 'package:plan_b/features/home/data/models/trip_time_status.dart';

class TripPlanSummary {
  const TripPlanSummary({
    required this.id,
    required this.planId,
    this.travelGuideId,
    required this.thumbnailUrl,
    required this.title,
    required this.destination,
    required this.tags,
    required this.period,
    required this.budget,
  });

  final String id;              // 플랜 id (플래너 화면 이동용)
  final int planId;             // 확정 전 플랜 id ('여행 플랜 다시 선택하기'에서 기존 추천 조회용)
  final int? travelGuideId;     // 월별 여행 준비 가이드 id (가이드가 아직 없으면 null)
  final String thumbnailUrl;    // 썸네일 이미지 URL
  final String title;           // 이탈리아 9월 여행 플랜
  final String destination;     // 헝가리 (진행중인 여행 카드용)
   final List<String> tags;      // 부다페스트, 근교 ('#' 없이, 진행중인 여행 카드용)
  final DateTimeRange period;   // 여행 기간
  final String budget;          // 예산 (표시 형식: '200-270만원')

  /// 시간을 버린 날짜 (날짜 단위 비교용)
  /// 연,월,일은 현지 날짜 그대로 쓰되 UTC로 만들어서, 썸머타임(DST) 전환일에도 날짜 차이가 정확히 일 단위로 계산되도록 함.
  static DateTime _dateOnly(DateTime d) => DateTime.utc(d.year, d.month, d.day);

  /// 여행 시작일 기준 남은 일수 (양수: 시작 전 / 0: 시작일 당일 / 음수: 시작일 이후)
  /// 디데이 태그는 상태와 관계없이 항상 시작일 기준
  int get daysLeft {
    final today = _dateOnly(DateTime.now());
    return _dateOnly(period.start).difference(today).inDays;
  }

  /// 오늘 기준 상태
  /// - 시작일 전: upcoming
  /// - 시작일 당일 ~ 종료일 당일: ongoing
  /// - 종료일 다음 날부터: past
  TripTimeStatus get status {
    final today = _dateOnly(DateTime.now());
    if (today.isBefore(_dateOnly(period.start))) return TripTimeStatus.upcoming;
    if (today.isAfter(_dateOnly(period.end))) return TripTimeStatus.past;
    return TripTimeStatus.ongoing;
  }
}