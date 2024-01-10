import 'package:get/get.dart';
import 'package:haircuts_barber_aja/app/data/midlewares/auth_middlewares.dart';

import '../modules/Auth/bindings/auth_binding.dart';
import '../modules/Auth/views/auth_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.AUTH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
        name: _Paths.AUTH,
        page: () => const AuthView(),
        binding: AuthBinding(),
        middlewares: [AuthMiddlewares(priority: 0)]),
  ];
}
