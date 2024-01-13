import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haircuts_barber_aja/app/data/addon/reuseable.dart';
import 'package:haircuts_barber_aja/app/modules/home/views/home_menu/home_beranda.dart';
import 'package:haircuts_barber_aja/app/modules/home/views/home_menu/home_chat.dart';
import 'package:haircuts_barber_aja/app/modules/home/views/home_menu/home_profile.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: reusableAppbar(
          title: controller.titleList[controller.bottomIndex.value],
          enableBack: false,
          actions: [
            if (controller.user?.accountType == ACCOUNT_TYPE.USER.name)
              GestureDetector(
                onTap: () {},
                child: const Card(
                  color: blackColor,
                  elevation: 3,
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Icon(
                      Icons.shopping_bag,
                      color: whiteColor,
                    ),
                  ),
                ),
              )
          ],
        ),
        body: PersistentTabView(
          context,
          backgroundColor: whiteColor,
          screens: const [
            HomeBeranda(),
            HomeChat(),
            HomeProfile(),
          ],
          controller: controller.persistenController,
          stateManagement: true,
          onItemSelected: (value) => controller.bottomIndex.value = value,
          hideNavigationBarWhenKeyboardShows: true,
          items: navbaritem(),
          navBarStyle: NavBarStyle.style7,
        ),
      ),
    );
  }

  List<PersistentBottomNavBarItem> navbaritem() {
    return [
      PersistentBottomNavBarItem(
        inactiveIcon: const Icon(Icons.home_outlined),
        activeColorSecondary: yellowColor,
        icon: const Icon(Icons.home),
        title: ("Home"),
        activeColorPrimary: blackColor,
        inactiveColorPrimary: blackColor,
      ),
      PersistentBottomNavBarItem(
        inactiveIcon: const Icon(Icons.chat_bubble_outline),
        activeColorSecondary: yellowColor,
        icon: const Icon(Icons.chat_bubble),
        title: ("Chat"),
        activeColorPrimary: blackColor,
        inactiveColorPrimary: blackColor,
      ),
      PersistentBottomNavBarItem(
        inactiveIcon: const Icon(Icons.person_4_outlined),
        activeColorSecondary: yellowColor,
        icon: const Icon(Icons.person_4),
        title: ("Profile"),
        activeColorPrimary: blackColor,
        inactiveColorPrimary: blackColor,
      ),
    ];
  }
}
