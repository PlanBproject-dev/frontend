import 'package:flutter/material.dart';

import 'package:plan_b/core/theme/app_colors.dart';
import 'package:plan_b/core/theme/app_text_styles.dart';
import 'package:plan_b/core/theme/app_effects.dart';
import 'package:plan_b/shared/widgets/cta_binary.dart';

/// 모달을 띄우고, 어떤 버튼을 눌렀는지 결과로 돌려줌
/// true: 확인(primary) / false: 돌아가기(secondary)
Future<bool?> showModalPrimary(
  BuildContext context, {
  required String title,
  String? caption,
  String secondaryText = '돌아가기',
  String primaryText = '확인',
}) async {
  final result = await showDialog<bool>(
    context: context,
    barrierColor: AppColors.dimBackdrop, // 배경 딤 컬러
    barrierDismissible: false, // 바깥 영역 탭으로 닫기 비활성화
    builder: (dialogContext) => PopScope(
      child: ModalPrimary(
        title: title,
        caption: caption,
        secondaryText: secondaryText,
        primaryText: primaryText,
        onSecondaryPressed: () => Navigator.pop(dialogContext, false),
        onPrimaryPressed: () => Navigator.pop(dialogContext, true),
      ),
    ),
  );

  return result ?? false;
}

/// 모달 UI
class ModalPrimary extends StatelessWidget {
  const ModalPrimary({
    super.key,
    required this.title,
    this.caption, // 모달 내 설명은 필수 요소 아님
    required this.secondaryText,
    required this.primaryText,
    required this.onSecondaryPressed,
    required this.onPrimaryPressed,
  });

  final String title;
  final String? caption;
  final String secondaryText;
  final String primaryText;
  final VoidCallback? onSecondaryPressed;
  final VoidCallback? onPrimaryPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        // 좁은 화면에서도 화면 가장자리와 최소 24만큼 간격 유지.
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Container(
          width: 318,
          padding: const EdgeInsets.fromLTRB(20, 32, 20, 20),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: AppEffects.boxShadowLg,
          ),
          
          child: Material(
            type: MaterialType.transparency,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              spacing: caption == null ? 24 : 20,
              children: [
                // 텍스트 영역
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  spacing: 8,   // 제목-캡션 사이의  간격
                  children: [
                    Text(
                      title,
                      style: AppTextStyles.titleSemiBold20.copyWith(
                        color: AppColors.gray800,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    if (caption != null)
                      Text(
                        caption!,
                        style: AppTextStyles.labelMedium16.copyWith(
                          color: AppColors.gray400,
                        ),
                        textAlign: TextAlign.center,
                      ),
                  ],
                ),

                // 모달 내 버튼 (cta_binary)
                CtaBinary(
                  secondaryText: secondaryText,
                  primaryText: primaryText,
                  onSecondaryPressed: onSecondaryPressed,
                  onPrimaryPressed: onPrimaryPressed,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}