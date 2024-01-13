import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haircuts_barber_aja/app/data/addon/reuseable.dart';
import 'package:haircuts_barber_aja/app/modules/home/controllers/home_controller.dart';

class HomeProfile extends GetView<HomeController> {
  const HomeProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: buildContentProfile(),
    );
  }

  Widget buildProfileHeader() {
    return Obx(
      () => SizedBox(
        height: 200,
        width: Get.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            reusableAvatar(size: 50, url: controller.user!.profileUrl),
            const SizedBox(
              height: 10,
            ),
            Text(
              controller.user?.name ?? "No Data",
              style: headerStyle(),
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              controller.user?.email ?? "No Data",
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ),
    );
  }

  Widget buildContentProfile() {
    return Column(
      children: [
        buildProfileHeader(),
        const Divider(),
        const SizedBox(
          height: 10,
        ),
        ...controller.profilMenu.map(
          (e) => ListTile(
            title: Text(
              e['title'],
            ),
            leading: Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: e['icon'],
              ),
            ),
            onTap: e['onTap'],
          ),
        )
      ],
    );
  }
}
