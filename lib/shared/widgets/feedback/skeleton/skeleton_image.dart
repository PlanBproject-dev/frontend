// 이미지가 로드되기 전까지 스켈레톤을 보여주는 이미지

import 'package:flutter/material.dart';

import 'package:plan_b/core/theme/app_colors.dart';
import 'package:plan_b/shared/widgets/feedback/skeleton/skeleton_box.dart';

class SkeletonImage extends StatelessWidget {
  const SkeletonImage({
    super.key,
    required this.image,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
  });

  final ImageProvider image;
  final double? width;
  final double? height;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return Image(
      image: image,
      width: width,
      height: height,
      fit: fit,
      frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
        if (wasSynchronouslyLoaded || frame != null) return child;
        return SkeletonBox(width: width, height: height);
      },
      errorBuilder: (context, error, stackTrace) => SizedBox(
        width: width,
        height: height,
        child: const ColoredBox(color: AppColors.gray50),
      ),
    );
  }
}