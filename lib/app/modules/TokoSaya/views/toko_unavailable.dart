import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haircuts_barber_aja/app/data/addon/reuseable.dart';
import 'package:haircuts_barber_aja/app/modules/TokoSaya/controllers/toko_saya_controller.dart';
import 'package:haircuts_barber_aja/app/routes/app_pages.dart';

class TokoUnavailable extends GetView<TokoSayaController> {
  const TokoUnavailable({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: reusableAppbar(title: 'Toko Saya', enableBack: true),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: GestureDetector(
            onTap: () {
              Get.toNamed(Routes.BUAT_TOKO);
            },
            child: Card(
              elevation: 3,
              color: blackColor,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  'Anda belum membuka BARBERSHOP, Tekan untuk buka sekarang',
                  style: headerStyle().copyWith(color: whiteColor),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
