// 툴팁
// 사용 예)
// TooltipPrimary(
//   message: '부연설명',
//   child: Row(children: [Text('라벨'), AppTooltipAnchor(child: 아이콘)]),
// )

import 'dart:math' show max;

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:plan_b/core/theme/app_colors.dart';
import 'package:plan_b/core/theme/app_effects.dart';
import 'package:plan_b/core/theme/app_text_styles.dart';

class TooltipPrimary extends StatefulWidget {
  const TooltipPrimary({
    super.key,
    required this.message,
    required this.child,
  });

  final String message; // 툴팁 문구 (줄바꿈은 \n)
  final Widget child;   // 탭하면 툴팁이 열리는 영역

  @override
  State<TooltipPrimary> createState() => _TooltipState();
}

/// 툴팁 꼬리가 가리킬 기준 위젯 (TooltipPrimary의 child 안 어디에 둬도 됨)
class TooltipAnchor extends StatefulWidget {
  const TooltipAnchor({super.key, required this.child});

  final Widget child;

  @override
  State<TooltipAnchor> createState() => _TooltipAnchorState();
}

class _TooltipAnchorState extends State<TooltipAnchor> {
  _TooltipState? _tooltip;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // 가장 가까운 TooltipPrimary에 자신을 기준 위젯으로 등록
    final tooltip =
        context.dependOnInheritedWidgetOfExactType<_TooltipScope>()?.state;
    if (tooltip == _tooltip) return;
    _tooltip?._unregisterAnchor(this);
    _tooltip = tooltip?.._registerAnchor(this);
  }

  @override
  void dispose() {
    _tooltip?._unregisterAnchor(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.child;
}

/// AppTooltipAnchor가 자신을 감싼 AppTooltip을 찾기 위한 연결 통로
class _TooltipScope extends InheritedWidget {
  const _TooltipScope({required this.state, required super.child});

  final _TooltipState state;

  @override
  bool updateShouldNotify(_TooltipScope oldWidget) => oldWidget.state != state;
}

class _TooltipState extends State<TooltipPrimary> {
  final OverlayPortalController _overlay = OverlayPortalController();
  final Object _tapGroup = Object(); // 트리거 + 툴팁을 하나의 탭 영역으로 묶음

  State<TooltipAnchor>? _anchor;
  ScrollPosition? _scrollPosition;

  void _registerAnchor(State<TooltipAnchor> anchor) => _anchor = anchor;

  void _unregisterAnchor(State<TooltipAnchor> anchor) {
    if (_anchor == anchor) _anchor = null;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // 감싸는 스크롤 영역이 있으면, 스크롤될 때 툴팁 닫기
    final position = Scrollable.maybeOf(context)?.position;
    if (position == _scrollPosition) return;
    _scrollPosition?.removeListener(_hide);
    _scrollPosition = position?..addListener(_hide);
  }

  @override
  void dispose() {
    _scrollPosition?.removeListener(_hide);
    super.dispose();
  }

  void _toggle() => setState(_overlay.isShowing ? _overlay.hide : _overlay.show);

  void _hide() {
    if (!_overlay.isShowing) return;
    // 빌드·레이아웃 도중(스크롤 위치 보정 등)에는 상태를 바꿀 수 없어서 다음 프레임으로 미룸
    if (SchedulerBinding.instance.schedulerPhase ==
        SchedulerPhase.persistentCallbacks) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) _hide();
      });
      return;
    }
    setState(_overlay.hide);
  }

  @override
  Widget build(BuildContext context) {
    return _TooltipScope(
      state: this,
      child: TapRegion(
        groupId: _tapGroup,
        onTapOutside: (_) => _hide(), // 바깥을 누르면 닫힘
        child: OverlayPortal(
          controller: _overlay,
          overlayChildBuilder: _buildTooltip,
          child: Semantics(
            button: true,
            tooltip: widget.message, // 스크린 리더에 툴팁 문구 전달
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: _toggle,
              child: widget.child,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTooltip(BuildContext overlayContext) {
    MediaQuery.sizeOf(overlayContext); // 화면 크기가 바뀌면 위치 다시 계산

    final overlayBox = Overlay.of(context).context.findRenderObject() as RenderBox?;
    // 기준 위젯: AppTooltipAnchor가 있으면 그것, 없으면 child 전체
    final targetBox = (_anchor?.context ?? context).findRenderObject() as RenderBox?;

    if (overlayBox == null ||
        targetBox == null ||
        !targetBox.attached ||
        !targetBox.hasSize) {
      return const SizedBox.shrink();
    }

    final Offset topLeft = targetBox.localToGlobal(Offset.zero, ancestor: overlayBox);

    return CustomMultiChildLayout(
      delegate: _TooltipLayoutDelegate(anchorRect: topLeft & targetBox.size),
      children: [
        LayoutId(
          id: _TooltipPart.tail,
          child: TapRegion(
            groupId: _tapGroup, // 툴팁을 눌러도 닫히지 않도록
            child: SvgPicture.asset(
              'assets/graphics/graphic_tooltip_tail.svg',
              width: _TooltipLayoutDelegate.tailSize,
              height: _TooltipLayoutDelegate.tailSize,
            ),
          ),
        ),
        LayoutId(
          id: _TooltipPart.body,
          child: TapRegion(
            groupId: _tapGroup,
            child: _TooltipBody(message: widget.message),
          ),
        ),
      ],
    );
  }
}

enum _TooltipPart { tail, body }

/// 기준 위젯 위치에 맞춰 꼬리와 본문을 배치
class _TooltipLayoutDelegate extends MultiChildLayoutDelegate {
  _TooltipLayoutDelegate({required this.anchorRect});

  final Rect anchorRect; // 기준 위젯의 화면상 위치

  static const double tailSize = 10;     // 꼬리 에셋 크기 (10x10)
  static const double _gap = 2;          // 기준 위젯 아래 ~ 꼬리 위 간격
  static const double _screenMargin = 12; // 본문이 화면 좌우 끝과 띄우는 최소 간격
  static const double _tailInset = 16;   // 꼬리가 본문 좌우 끝에서 떨어지는 최소 간격 (피그마 pl/pr 16)

  /// min > max가 되는 좁은 경우에도 에러 없이 가운데 값 사용
  static double _clamp(double value, double min, double max) =>
      max < min ? (min + max) / 2 : value.clamp(min, max).toDouble();

  @override
  void performLayout(Size size) {
    final double anchorX = anchorRect.center.dx;
    final double tailTop = anchorRect.bottom + _gap;

    final Size tail = layoutChild(_TooltipPart.tail, BoxConstraints.loose(size));
    final Size body = layoutChild(
      _TooltipPart.body,
      BoxConstraints(maxWidth: max(0, size.width - _screenMargin * 2)),
    );

    // 본문: 기준 위젯 가운데 정렬 → 화면 밖으로 나가면 좌우 여백 안으로
    final double bodyLeft = _clamp(
      anchorX - body.width / 2,
      _screenMargin,
      size.width - _screenMargin - body.width,
    );

    // 꼬리: 기준 위젯 가운데를 가리키되, 본문 좌우 끝에서 16 안쪽까지만
    final double tailLeft = _clamp(
      anchorX - tail.width / 2,
      bodyLeft + _tailInset,
      bodyLeft + body.width - _tailInset - tail.width,
    );

    positionChild(_TooltipPart.tail, Offset(tailLeft, tailTop));
    positionChild(_TooltipPart.body, Offset(bodyLeft, tailTop + tail.height));
  }

  @override
  bool shouldRelayout(_TooltipLayoutDelegate oldDelegate) =>
      oldDelegate.anchorRect != anchorRect;
}

/// 툴팁 본문 (dim_surface_dark / radius 12 / label_m_12 white)
class _TooltipBody extends StatelessWidget {
  const _TooltipBody({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency, // 오버레이 안 텍스트 기본 스타일용
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: AppColors.dimSurfaceDark,
          borderRadius: BorderRadius.circular(12),
          boxShadow: AppEffects.boxShadowSm,
        ),
        child: Text(
          message,
          style: AppTextStyles.labelMedium12.copyWith(color: AppColors.white),
        ),
      ),
    );
  }
}