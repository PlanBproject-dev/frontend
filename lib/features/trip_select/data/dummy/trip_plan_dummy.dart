// 여행 플랜 더미데이터 (분석 API 연동 전 임시임.)

import 'package:plan_b/features/trip_select/data/models/budget_level.dart';
import 'package:plan_b/features/trip_select/data/models/trip_plan.dart';

/// 목표 기준 플로우: 예산 수준 + 플랜
typedef BudgetLevelPlan = ({BudgetLevel level, TripPlan plan});

TripPlan _plan({
  required String id,
  required int rank,
  required String country,
  required List<String> tags,
}) =>
    TripPlan(
      id: id,
      rank: rank,
      country: country,
      tags: tags,
      highlights: const [
        TripPlanCostItem(title: '도쿄 핵심 명소 투어', cost: '약 15만원'),
        TripPlanCostItem(title: '도쿄 디즈니랜드', cost: '약 12만원'),
        TripPlanCostItem(title: '하코네 온천+로프웨이+유람선', cost: '약 70만원'),
      ],
      accommodation: const TripPlanCostItem(title: '호스텔 패밀리룸 (6박)', cost: '50-70만원'),
      flight: const TripPlanCostItem(title: '저가항공 직행 왕복', cost: '60-90만원'),
      totalCost: '200-270만원',
      summary: '이동 부담 없이 핵심 명소를 효율적으로\n경험할 수 있는 안정적인 선택!',
    );

/// 지갑 기준 플로우: TOP 1~6 (처음엔 3개, 더보기 시 4~6위 추가)
final List<TripPlan> dummyBudgetFirstPlans = [
  _plan(id: 'b1', rank: 1, country: '일본 도쿄', tags: ['도쿄', '하코네', '디즈니랜드']),
  _plan(id: 'b2', rank: 2, country: '헝가리', tags: ['부다페스트', '근교', '야경크루즈']),
  _plan(id: 'b3', rank: 3, country: '이탈리아', tags: ['로마', '피렌체', '베네치아']),
  _plan(id: 'b4', rank: 4, country: '베트남 다낭', tags: ['다낭', '호이안', '바나힐']),
  _plan(id: 'b5', rank: 5, country: '체코', tags: ['프라하', '체스키크룸로프']),
  _plan(id: 'b6', rank: 6, country: '대만', tags: ['타이베이', '지우펀', '스펀']),
];

/// 목표 기준 플로우: 고/중/저예산 플랜 3개
final List<BudgetLevelPlan> dummyGoalFirstPlans = [
  (level: BudgetLevel.high, plan: _plan(id: 'g1', rank: 1, country: '일본', tags: ['도쿄', '하코네', '디즈니랜드'])),
  (level: BudgetLevel.medium, plan: _plan(id: 'g2', rank: 2, country: '일본', tags: ['도쿄', '하코네', '디즈니랜드'])),
  (level: BudgetLevel.low, plan: _plan(id: 'g3', rank: 3, country: '일본', tags: ['도쿄', '하코네', '디즈니랜드'])),
];