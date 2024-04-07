import 'package:flutter/cupertino.dart';
import 'package:l/l.dart';

import 'common/local/app_storage.dart';

Future<void> setup() async {
  WidgetsFlutterBinding.ensureInitialized();

  await getStorageValues();

  // await AwesomeNotifications().initialize(
  //   null,
  //   [
  //     NotificationChannel(
  //       channelKey: 'markAsRead',
  //       channelName: 'Basic notifications',
  //       channelDescription: 'Notification channel for basic tests',
  //       defaultColor: const Color(0xFF9D50DD),
  //       ledColor: AppColors.white,
  //       importance: NotificationImportance.High,
  //       channelShowBadge: true,
  //       playSound: true,
  //     ),
  //   ],
  //   debug: true,
  // );
}

String? token;

Future<void> getStorageValues() async {
  // token = 315ebafe5d179625e1646ee181cc09b2
  token = await AppStorage.read(StorageKey.token);
  l.w(token ?? '------\n------------\n-----------\n-------' ' ====================================');
}
