import 'package:get/get.dart';

import '../controllers/toko_saya_pesanan_controller.dart';

class TokoSayaPesananBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TokoSayaPesananController>(
      () => TokoSayaPesananController(),
    );
  }
}
