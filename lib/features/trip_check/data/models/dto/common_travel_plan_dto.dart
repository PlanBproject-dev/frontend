// 지갑/목표 기준 요청 바디의 공통 영역 (common)
// - TripCheckDraft(앱 상태) -> 서버 스펙으로 변환
// - 값이 없으면 키를 빼고 보낸다 (임시저장 시 미입력 필드)

import 'package:plan_b/features/trip_check/data/models/options/accommodation_type.dart';
import 'package:plan_b/features/trip_check/data/models/options/companion_type.dart';
import 'package:plan_b/features/trip_check/data/models/options/flight_preference.dart';
import 'package:plan_b/features/trip_check/data/models/options/travel_style.dart';
import 'package:plan_b/features/trip_check/data/models/trip_check_draft.dart';
import 'package:plan_b/features/trip_check/presentation/widgets/segmented_chip.dart';

class CommonTravelPlanDto {
  const CommonTravelPlanDto({
    required this.draft,
    required this.isDraft,
  });

  final TripCheckDraft draft;
  final bool isDraft;     // true: 임시저장, false: 최종 제출

  Map<String, dynamic> toJson() {
    final period = draft.travelPeriod;
    final companion = draft.companionType;
    final flights = draft.flightPreferences;
    final airline = flights[FlightPreference.airline];
    final route = flights[FlightPreference.route];
    final tripWay = flights[FlightPreference.tripWay];

    final travelStyles = draft.travelStyles.map(_style).toList();
    final lodgingTypes = draft.accommodationTypes.map(_lodging).toList();

    return {
      'isDraft': isDraft,
      if (period != null) 'startDate': _date(period.start),
      if (period != null) 'endDate': _date(period.end),
      if (draft.peopleCount != null) 'memberCount': draft.peopleCount,
      if (companion != null) 'memberType': _member(companion),
      if (travelStyles.isNotEmpty) 'travelStyles': travelStyles,
      if (lodgingTypes.isNotEmpty) 'lodgingTypes': lodgingTypes,
      if (airline != null)
        'flightType': airline == SegmentedChipSide.left ? 'MAJOR' : 'LOW_COST',
      if (route != null)
        'flightRoute': route == SegmentedChipSide.left ? 'DIRECT' : 'TRANSFER',
      if (tripWay != null) 'isRoundFlight': tripWay == SegmentedChipSide.left,
    };
  }

  /// yyyy-MM-dd
  static String _date(DateTime d) =>
      '${d.year.toString().padLeft(4, '0')}-'
      '${d.month.toString().padLeft(2, '0')}-'
      '${d.day.toString().padLeft(2, '0')}';

  static String _member(CompanionType type) => switch (type) {
        CompanionType.solo => 'ALONE',
        CompanionType.family => 'FAMILY',
        CompanionType.friends => 'FRIEND',
        CompanionType.couple => 'COUPLE',
        CompanionType.business => 'BUSINESS',
        CompanionType.group => 'GROUP',
      };

  static String _style(TravelStyle style) => switch (style) {
        TravelStyle.activity => 'ACTIVITY',
        TravelStyle.scenery => 'SCENERY',
        TravelStyle.landmark => 'LANDMARK',
        TravelStyle.food => 'FOOD_TOUR',
        TravelStyle.relaxation => 'RELAXATION',
        TravelStyle.artCulture => 'ART_CULTURE',
      };

  static String _lodging(AccommodationType type) => switch (type) {
        AccommodationType.hotel => 'HOTEL',
        AccommodationType.hostel => 'HOSTEL',
        AccommodationType.pension => 'RENTAL',
        AccommodationType.poolVilla => 'POOL_VILLA',
        AccommodationType.resort => 'RESORT',
      };
}