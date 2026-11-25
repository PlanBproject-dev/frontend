// 푸시 알림 설정

import 'package:flutter_riverpod/flutter_riverpod.dart';

class PushNotificationNotifier extends Notifier<bool> {
  @override
  bool build() => true;

  void setEnabled(bool isEnabled) => state = isEnabled;
}

final pushNotificationProvider =
    NotifierProvider<PushNotificationNotifier, bool>(PushNotificationNotifier.new);