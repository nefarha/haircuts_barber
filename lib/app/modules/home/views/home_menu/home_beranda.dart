import 'package:flutter/material.dart';
import 'package:focus_detector/focus_detector.dart';
import 'package:get/get.dart';
import 'package:haircuts_barber_aja/app/data/addon/reuseable.dart';
import 'package:haircuts_barber_aja/app/modules/home/controllers/barber_controller.dart';
import 'package:haircuts_barber_aja/app/routes/app_pages.dart';

class HomeBeranda extends GetView<BarberController> {
  const HomeBeranda({super.key});

  @override
  Widget build(BuildContext context) {
    return FocusDetector(
      onFocusGained: () async {
        await controller.pullRefresh();
      },
      child: Padding(
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
            ],
          ),
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
          onTap: () {},
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
        child: controller.obx(
          (state) => Row(
            children: state!
                .map((model) => reusableShopCard(
                      model: model,
                      onTap: () =>
                          Get.toNamed(Routes.DETAIL_TOKO, arguments: model),
                    ))
                .toList(),
          ),
          onLoading: Row(
            children: List.generate(
              5,
              (index) => reusableShimmerShopCard(),
            ),
          ),
          onEmpty: Row(
            children: List.generate(
              5,
              (index) => reusableEmptyShopCard(),
            ),
          ),
        ),
      ),
    );
  }
}
