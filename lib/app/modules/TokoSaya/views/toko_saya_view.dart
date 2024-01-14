import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haircuts_barber_aja/app/modules/TokoSaya/views/toko_available.dart';
import 'package:haircuts_barber_aja/app/modules/TokoSaya/views/toko_unavailable.dart';

import '../controllers/toko_saya_controller.dart';

class TokoSayaView extends GetView<TokoSayaController> {
  const TokoSayaView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.user!.barberId == null) {
        return const TokoUnavailable();
      } else {
        return const TokoAvailable();
      }
    });
  }
}
