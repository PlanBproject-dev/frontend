// 스켈레톤 UI 공통 박스

import 'package:flutter/material.dart';

import 'package:plan_b/core/theme/app_colors.dart';

class SkeletonBox extends StatefulWidget {
  const SkeletonBox({
    super.key,
    this.width,
    this.height,
    this.color = AppColors.gray50,
    this.borderRadius = BorderRadius.zero,
    this.shimmerPadding = EdgeInsets.zero,
    this.shimmerBorderRadius,
  });

  final double? width;
  final double? height;
  final Color color;                         // 기본 배경 (기본값 gray50, 화면에 따라 dimSurfaceLight)
  final BorderRadius borderRadius;           // 박스 라운드
  final EdgeInsets shimmerPadding;           // shimmer 영역 안쪽 여백 (기본: 박스 전체)
  final BorderRadius? shimmerBorderRadius;   // shimmer 영역 라운드 (null이면 borderRadius와 동일)

  static const Duration _duration = Duration(milliseconds: 1200);
  static const double _shimmerWidthFactor = 0.5; // 박스 전체 너비의 50%

  // 양 끝은 투명, 가운데(50%)가 흰색
  static const LinearGradient _shimmerGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [Color(0x00FFFFFF), AppColors.white, Color(0x00FFFFFF)],
    stops: [0.0, 0.5, 1.0],
  );

  @override
  State<SkeletonBox> createState() => _SkeletonBoxState();
}

class _SkeletonBoxState extends State<SkeletonBox>
    with SingleTickerProviderStateMixin {
  // repeat(): 끝나면 바로 처음부터 다시 시작 (대기 없음)
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: SkeletonBox._duration,
  )..repeat();

  late final Animation<double> _progress = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeInOut,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ExcludeSemantics(
      child: RepaintBoundary(
        // 애니메이션 다시 그리기가 주변 위젯까지 번지지 않도록
        child: SizedBox(
          width: widget.width,
          height: widget.height,
          child: ClipRRect(
            borderRadius: widget.borderRadius,
            child: ColoredBox(
              color: widget.color,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  // shimmer 너비는 박스 전체 너비 기준
                  final double shimmerWidth =
                      constraints.maxWidth * SkeletonBox._shimmerWidthFactor;
                  // shimmer가 실제로 지나가는 영역 너비
                  final double areaWidth =
                      constraints.maxWidth - widget.shimmerPadding.horizontal;

                  return Padding(
                    padding: widget.shimmerPadding,
                    child: ClipRRect(
                      borderRadius:
                          widget.shimmerBorderRadius ?? widget.borderRadius,
                      child: AnimatedBuilder(
                        animation: _progress,
                        // shimmer는 위치만 바뀌므로 child로 한 번만 생성
                        child: const DecoratedBox(
                          decoration: BoxDecoration(
                            gradient: SkeletonBox._shimmerGradient,
                          ),
                        ),
                        builder: (context, child) {
                          // 영역 왼쪽 바깥(-shimmerWidth) -> 오른쪽 바깥(areaWidth)까지 이동
                          final double left = -shimmerWidth +
                              (areaWidth + shimmerWidth) * _progress.value;

                          return Stack(
                            fit: StackFit.expand,
                            children: [
                              Positioned(
                                left: left,
                                top: 0,
                                bottom: 0,
                                width: shimmerWidth,
                                child: child!,
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}