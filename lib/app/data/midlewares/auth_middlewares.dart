import 'package:flutter/src/widgets/navigator.dart';
import 'package:get/get.dart';
import 'package:haircuts_barber_aja/app/controllers/authentication_controller.dart';
import 'package:haircuts_barber_aja/app/routes/app_pages.dart';

class AuthMiddlewares extends GetMiddleware {
  AuthMiddlewares({required this.priority});
  final authC = AuthenticationController.instance;

  @override
  int? priority;

  @override
  RouteSettings? redirect(String? route) {
    if (authC.currentUser.value != null) {
      if (authC.currentUser.value!.phoneNumber!.isEmpty) {
        return const RouteSettings(name: Routes.PHONE_AUTH);
      }
      return null;
    } else {
      return const RouteSettings(name: Routes.AUTH);
    }
  }
}
