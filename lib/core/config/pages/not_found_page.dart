// not_found_page.dart
// - 정의되지 않은 경로로 이동했을 때 표시하는 화면 (GoRouter errorBuilder)

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:plan_b/core/config/app_routes.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('페이지를 찾을 수 없어요'),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () => context.go(AppRoutes.home),
              child: const Text('홈으로 가기'),
            ),
          ],
        ),
      ),
    );
  }
}