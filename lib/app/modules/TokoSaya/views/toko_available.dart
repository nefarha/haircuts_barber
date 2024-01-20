import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haircuts_barber_aja/app/data/addon/reuseable.dart';
import 'package:haircuts_barber_aja/app/modules/TokoSaya/controllers/toko_saya_controller.dart';

class TokoAvailable extends GetView<TokoSayaController> {
  const TokoAvailable({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: reusableAppbar(
          title: 'Toko Saya',
          enableBack: true,
          actions: controller.daftarActionButton
              .map(
                (e) => IconButton(
                  onPressed: e['onTap'],
                  icon: e['icon'],
                ),
              )
              .toList()),
      body: controller.obx(
        (_) => SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              shopImage(),
              shopTitle(),
              shopDescription(),
              shopBundle(),
              shopTestimonial(),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget shopImage() {
    return Obx(
      () => SizedBox(
        height: 250,
        width: Get.width,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const PageScrollPhysics(),
          child: controller.barberModel.value!.daftarGambar.isNotEmpty
              ? Row(
                  children: controller.barberModel.value!.daftarGambar
                      .map(
                        (url) => Container(
                          height: Get.height,
                          width: Get.width,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: CachedNetworkImageProvider(url),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                )
              : Container(
                  height: Get.height,
                  width: Get.width,
                  color: yellowColor,
                  child: const Center(
                    child: Text(
                      'Tidak ada gambar',
                    ),
                  ),
                ),
        ),
      ),
    );
  }

  Widget shopTitle() {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.all(20),
        child: SizedBox(
          width: Get.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                controller.barberModel.value!.namaToko,
                overflow: TextOverflow.ellipsis,
                style: headerStyle(),
              ),
              Text(
                controller.barberModel.value!.alamat.alamat,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(color: greyColor),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Icon(
                    Icons.star,
                    color: greyColor,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    controller.barberModel.value!.rating.toString(),
                    style: TextStyle(color: greyColor),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Divider(
                color: greyColor,
              ),
              ListTile(
                contentPadding: const EdgeInsets.all(0),
                leading: reusableAvatar(url: controller.user!.profileUrl),
                title: Text(controller.user!.name),
                subtitle: Text(controller.barberModel.value!.shopType!),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget shopDescription() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Tentang Toko',
            style: headerStyle(),
            overflow: TextOverflow.ellipsis,
          ),
          Obx(
            () => Text(
              controller.barberModel.value!.deskripsiToko,
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }

  Widget shopBundle() {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Card(
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: SizedBox(
            height: 50,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(controller
                      .barberModel.value!.daftarPaket.first.namaPaket),
                  const Spacer(),
                  Text(
                      '${moneyFormat(money: controller.barberModel.value!.daftarPaket.first.hargaPaket)}/servis')
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget shopTestimonial() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Testimonials',
            style: headerStyle(),
          ),
          // ...List.generate(
          //   4,
          //   (index) => testimonialCard(index: index),
          // )
        ],
      ),
    );
  }
}
