import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:plan_b/core/theme/app_colors.dart';
import 'package:plan_b/core/theme/app_text_styles.dart';
import 'package:plan_b/shared/widgets/btn/btn_check.dart';

/// 여행 플랜 기준 선택 카드의 종류
enum TripSelectionType {
  budget, // 내 지갑 기준
  goal,  // 여행 목표 기준
}

class TripSelectionCard extends StatelessWidget {
  const TripSelectionCard({
    super.key,
    required this.type,
    required this.isSelected,
    this.onTap,
  });

  final TripSelectionType type; // budget, goal
  final bool isSelected;        // 선택 여부
  final VoidCallback? onTap;    // 카드 탭 콜백. null이면 표시 전용(탭 불가)

  // 선택 모션 (BtnToggle과 동일)
  static const Duration _duration = Duration(milliseconds: 200);
  static const Curve _curve = Curves.easeInOut;

  static const double _radius = 8;

  // 좌상단 하이라이트 에셋: 카드 좌상단 기준 고정 위치
  static const double _ellipseWidth = 658.5;
  static const double _ellipseHeight = 402;
  static const double _ellipseLeft = -269;
  static const double _ellipseTop = -178;

  // 우측 그래픽 이미지: 카드 오른쪽 기준 9px 마진으로 고정
  static const double _imageSize = 130;
  static const double _imageRight = 9;

  @override
  Widget build(BuildContext context) {
    final (String label, String title, String imagePath) = switch (type) {
      TripSelectionType.budget => (
          '내 지갑을 기준으로',
          '가능한 예산에 따라\n여행 플랜을 짜고 싶어요',
          'assets/img/img_budget.png',
        ),
      TripSelectionType.goal => (
          '여행 목표를 기준으로',
          '여행 국가와 시기에 따라\n맞춤 예산을 짜고 싶어요',
          'assets/img/img_trip_goal.png',
        ),
    };

    // 이미지 top 위치
    final double imageTop = switch ((type, isSelected)) {
      (TripSelectionType.budget, true) => 35,
      (TripSelectionType.budget, false) => 42,
      (TripSelectionType.goal, _) => 37,
    };

    final card = ClipRRect(
      borderRadius: BorderRadius.circular(_radius),
      child: AnimatedContainer(
        duration: _duration,
        curve: _curve,
        width: double.infinity, // 부모 너비를 꽉 채우도록
        color: isSelected ? AppColors.blue100 : AppColors.bgSolidBasic,
        child: Stack(
          clipBehavior: Clip.hardEdge, // 카드 밖으로 나가는 그래픽은 잘리게
          children: [
            // 선택 시 좌측 상단의 ellipse가 배경에 뜨도록
            Positioned(
              left: _ellipseLeft,
              top: _ellipseTop,
              width: _ellipseWidth,
              height: _ellipseHeight,
              child: IgnorePointer(
                child: AnimatedOpacity(
                  duration: _duration,
                  curve: _curve,
                  opacity: isSelected ? 1 : 0,
                  child: SvgPicture.asset(
                    'assets/backgrounds/bg_top_left_ellipse.svg',
                    width: _ellipseWidth,
                    height: _ellipseHeight,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),

            // 우측 그래픽 이미지 (미선택 시 opacity 30% 적용)
            AnimatedPositioned(
              duration: _duration,
              curve: _curve,
              right: _imageRight,
              top: imageTop,
              width: _imageSize,
              height: _imageSize,
              child: AnimatedOpacity(
                duration: _duration,
                curve: _curve,
                opacity: isSelected ? 1 : 0.3,
                child: Image.asset(
                  imagePath,
                  width: _imageSize,
                  height: _imageSize,
                  fit: BoxFit.contain,
                ),
              ),
            ),

            // 텍스트 영역: 선택 시 하단 패딩이 늘어나 카드가 커지는 애니메이션 적용
            AnimatedPadding(
              duration: _duration,
              curve: _curve,
              padding: EdgeInsets.fromLTRB(24, 20, 24, isSelected ? 60 : 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  AnimatedDefaultTextStyle(
                    duration: _duration,
                    curve: _curve,
                    style: AppTextStyles.labelSemiBold14.copyWith(
                      color: isSelected ? AppColors.blue600 : AppColors.gray400,
                    ),
                    child: Text(label),
                  ),
                  const SizedBox(height: 8),
                  AnimatedDefaultTextStyle(
                    duration: _duration,
                    curve: _curve,
                    style: AppTextStyles.titleSemiBold18.copyWith(
                      color: isSelected ? AppColors.black : AppColors.gray800,
                    ),
                    child: Text(title),
                  ),
                ],
              ),
            ),

            // 우측 상단 체크 버튼 (그러나 탭 영역은 카드 전체임, 체크 버튼에만 해당하지 않는다)
            Positioned(
              top: 16,
              right: 16,
              child: BtnCheck(isSelected: isSelected),
            ),
          ],
        ),
      ),
    );

    return Semantics(
      button: true,
      selected: isSelected, // 스크린 리더에 선택 상태 전달
      child: onTap == null
          ? card
          : GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: onTap,
              child: card,
            ),
    );
  }
}