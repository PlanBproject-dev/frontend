import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:plan_b/core/config/router.dart';
import 'package:plan_b/core/theme/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: '.env');

  // Riverpod 사용 : 앱 전체를 ProviderScope로 감쌈
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // 내 앱의 roots
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      title: 'planB',
      theme: AppTheme.light,  // 앱 전체에 공용 테마 적용
      routerConfig: ref.watch(routerProvider),
    );
  }
}
