import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// 프로필 그래픽 (이미지 데이터 받는 기능 아님)
class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({super.key});

  static const double _size = 48;
  static const String _asset = 'assets/graphics/graphic_person_40px.svg';

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(_asset, width: _size, height: _size);
  }
}