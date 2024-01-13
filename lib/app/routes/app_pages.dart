import 'package:get/get.dart';

import '../data/midlewares/auth_middlewares.dart';
import '../modules/AccountInfo/bindings/account_info_binding.dart';
import '../modules/AccountInfo/views/account_info_view.dart';
import '../modules/Auth/bindings/auth_binding.dart';
import '../modules/Auth/views/auth_view.dart';
import '../modules/PhoneAuth/bindings/phone_auth_binding.dart';
import '../modules/PhoneAuth/views/phone_auth_view.dart';
import '../modules/ShopDetail/bindings/shop_detail_binding.dart';
import '../modules/ShopDetail/views/shop_detail_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/checkValidatedPage.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.AUTH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const CheckValidated(),
      binding: HomeBinding(),
    ),
    GetPage(
        name: _Paths.AUTH,
        page: () => const AuthView(),
        binding: AuthBinding(),
        middlewares: [AuthMiddlewares(priority: 0)]),
    GetPage(
      name: _Paths.PHONE_AUTH,
      page: () => const PhoneAuthView(),
      binding: PhoneAuthBinding(),
    ),
    GetPage(
      name: _Paths.SHOP_DETAIL,
      page: () => const ShopDetailView(),
      binding: ShopDetailBinding(),
    ),
    GetPage(
      name: _Paths.ACCOUNT_INFO,
      page: () => const AccountInfoView(),
      binding: AccountInfoBinding(),
    ),
  ];
}
