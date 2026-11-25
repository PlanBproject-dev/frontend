// 마이페이지 확인 모달 (로그아웃 / 회원탈퇴)

import 'package:flutter/material.dart';

import 'package:plan_b/shared/widgets/feedback/modal_primary.dart';

/// 로그아웃 확인 모달. true: 확인 / false: 돌아가기
Future<bool> showLogoutModal(BuildContext context) {
  return showModalPrimary(
    context,
    title: '로그아웃하시겠습니까?',
  );
}

/// 회원탈퇴 경고 모달. true: 확인 / false: 돌아가기
Future<bool> showDeleteAccountModal(BuildContext context) {
  return showModalPrimary(
    context,
    title: '회원 탈퇴하시겠습니까?',
    caption: '탈퇴 시 계정의 모든 데이터가\n삭제되며, 복구가 불가능합니다.',
  );
}