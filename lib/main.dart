import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:haircuts_barber_aja/app/controllers/authentication_controller.dart';
import 'package:haircuts_barber_aja/app/data/addon/reuseable.dart';
import 'package:haircuts_barber_aja/firebase_options.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'app/routes/app_pages.dart';

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
    // Get.put(FirestoreController());
    Get.put(AuthenticationController());
    // Get.put(StorageController());
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
