import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:haircuts_barber_aja/app/controllers/authentication_controller.dart';
import 'package:haircuts_barber_aja/app/controllers/storage_controller.dart';
import 'package:haircuts_barber_aja/app/data/addon/reuseable.dart';
import 'package:haircuts_barber_aja/firebase_options.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'app/routes/app_pages.dart';

AndroidNotificationChannel channel = const AndroidNotificationChannel(
  "newnotif",
  "Notifikasi baru",
  description: "Ada notifikasi baru",
  importance: Importance.high,
  playSound: true,
);

Future<void> _backgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}

final FlutterLocalNotificationsPlugin localPlugin =
    FlutterLocalNotificationsPlugin();

StreamSubscription foregroundMessage() => FirebaseMessaging.onMessage.listen(
      (RemoteMessage message) {
        RemoteNotification notification = message.notification!;

        localPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(channel.id, channel.name,
                channelDescription: channel.description,
                playSound: true,
                icon: '@mipmap/ic_launcher'),
          ),
        );
      },
    );

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const HaircutApp());
}

class HaircutApp extends StatelessWidget {
  const HaircutApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AuthenticationController());
    Get.put(StorageController());
    return GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      defaultTransition: Transition.cupertino,
      theme: customThemeData(),
    );
  }
}

ThemeData customThemeData() {
  return ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: whiteColor,
      background: whiteColor,
      surfaceTint: Colors.transparent,
    ),
    textTheme: GoogleFonts.poppinsTextTheme(),
  );
}
