import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// 영수증 하단 톱니 가장자리 (에셋 하나를 색상만 바꿔서 사용)
class ReceiptEdge extends StatelessWidget {
  const ReceiptEdge({super.key, required this.color});

  final Color color;

  static const String _asset = 'assets/graphics/graphic_receipt_edge.svg';

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      _asset,
      width: double.infinity,
      height: 12,
      fit: BoxFit.fill,
      colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
    );
  }
}