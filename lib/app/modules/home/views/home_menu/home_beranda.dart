import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haircuts_barber_aja/app/data/addon/reuseable.dart';
import 'package:haircuts_barber_aja/app/modules/home/controllers/home_controller.dart';
import 'package:haircuts_barber_aja/app/routes/app_pages.dart';

class HomeBeranda extends GetView<HomeController> {
  const HomeBeranda({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildAd(),
            const SizedBox(
              height: 20,
            ),
            buildSearch(),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Baca-baca',
              style: headerStyle(),
            ),
            buildReadContent(),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Toko Teratas',
              style: headerStyle(),
            ),
            buildTopRatedShop(),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Dikota yang sama',
              style: headerStyle(),
            ),
            buildShop(),
          ],
        ),
      ),
    );
  }

  Widget buildAd() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 150,
        width: Get.width,
        decoration: const BoxDecoration(
          color: yellowColor,
        ),
      ),
    );
  }

  Widget buildSearch() {
    return Card(
      elevation: 3,
      clipBehavior: Clip.antiAlias,
      child: SizedBox(
        width: Get.width,
        child: ListTile(
          onTap: () {
            print('AKU DITEKAN');
          },
          title: const Text('Cari...'),
          trailing: const Icon(Icons.search),
        ),
      ),
    );
  }

  Widget buildReadContent() {
    return SizedBox(
      height: 150,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(
              4,
              (index) => reusableContentCard(
                  title: index.toString(), creator: 'Lorem Ipsum')),
        ),
      ),
    );
  }

  Widget buildTopRatedShop() {
    return SizedBox(
      height: 250,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(
              4,
              (index) => reusableShopCard(
                  onTap: () {
                    Get.toNamed(Routes.SHOP_DETAIL);
                  },
                  title: 'Barbershop ${index + 1}',
                  location: 'Lorem Ipsum' * 10)),
        ),
      ),
    );
  }

  Widget buildShop() {
    return SizedBox(
      height: 250,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(
              4,
              (index) => reusableShopCard(
                  onTap: () {
                    Get.toNamed(Routes.SHOP_DETAIL);
                  },
                  title: 'Near Shop ${index + 1}',
                  location: 'Lorem Ipsum' * 10)),
        ),
      ),
    );
  }
}
