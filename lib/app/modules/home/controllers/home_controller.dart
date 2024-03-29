import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haircuts_barber_aja/app/controllers/authentication_controller.dart';
import 'package:haircuts_barber_aja/app/controllers/user_controller.dart';
import 'package:haircuts_barber_aja/app/data/addon/reuseable.dart';
import 'package:haircuts_barber_aja/app/data/model/user/repository/user_repo.dart';
import 'package:haircuts_barber_aja/app/data/model/user/userModel.dart';
import 'package:haircuts_barber_aja/app/routes/app_pages.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class HomeController extends GetxController {
  final authC = AuthenticationController.instance;
  final userRepo = UserRepo();
  UserModel? get user => UserController.instance.user.value;
  late PersistentTabController persistenController;

  var bottomIndex = 0.obs;
  final count = 0.obs;
  var isLoading = false.obs;

  List<String> titleList = ["BERANDA", "OBROLAN", "PROFIL", "PESANAN"];

  List<Map<String, dynamic>> get profilMenu => [
        {
          'title': "Info Akun",
          'icon': const Icon(
            Icons.person,
            color: Colors.blue,
          ),
          'onTap': () {
            Get.toNamed(Routes.ACCOUNT_INFO);
          },
        },
        {
          'title': "Favourite",
          'icon': const Icon(
            Icons.favorite_outlined,
            color: Colors.pink,
          ),
          'onTap': () {
            // Get.toNamed(Routes.FAVOURITE);
          },
        },
        {
          'title': "History Pembayaran",
          'icon': const Icon(
            Icons.payment_outlined,
            color: Colors.green,
          ),
          'onTap': () {
            Get.toNamed(Routes.HISTORY_PEMBAYARAN);
          },
        },
        {
          'title': "Log out",
          'icon': const Icon(
            Icons.logout,
            color: Colors.red,
          ),
          'onTap': () async {
            updateLoading(currentValue: isLoading, newValue: true);
            await authC.logout();
            updateLoading(currentValue: isLoading, newValue: false);
          },
        },
      ];

  @override
  void onInit() {
    persistenController = PersistentTabController(
      initialIndex: bottomIndex.value,
    );

    super.onInit();
  }
}
