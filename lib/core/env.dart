import 'package:flutter_dotenv/flutter_dotenv.dart';

/// .env에서 꼭 필요한 값을 읽음
/// 없거나 비어 있으면 원인이 바로 보이는 에러로 앱 시작을 중단
String requireEnv(String key) {
  final value = dotenv.env[key];
  if (value == null || value.isEmpty) {
    throw StateError(
      '.env에 $key 값이 없어요. 프로젝트 루트의 .env.example을 참고해 .env에 추가해 주세요.',
    );
  }
  return value;
}
