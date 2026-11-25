import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// 지갑 기준 4~6순위를 열람한 planId 기록
/// - '여행 플랜 다시 선택하기'로 돌아갔을 때 1~6순위까지 다시 보여주기 위함 (서버 응답에 열람 여부가 없음)
/// - 로그아웃 시 TokenStorage.clear()의 deleteAll로 함께 삭제됨
class WalletMoreViewedStorage {
  final _storage = const FlutterSecureStorage();
  static const _key = 'wallet_more_viewed_plan_ids';

  Future<Set<int>> _read() async {
    final String? raw = await _storage.read(key: _key);
    if (raw == null || raw.isEmpty) return {};
    return raw.split(',').map(int.tryParse).whereType<int>().toSet();
  }

  Future<bool> isViewed(int planId) async => (await _read()).contains(planId);

  Future<void> markViewed(int planId) async {
    final Set<int> ids = await _read()..add(planId);
    await _storage.write(key: _key, value: ids.join(','));
  }
}

final walletMoreViewedStorageProvider = Provider((ref) => WalletMoreViewedStorage());