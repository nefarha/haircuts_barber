import 'package:get/get.dart';

import '../controllers/toko_saya_controller.dart';

class TokoSayaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TokoSayaController>(
      () => TokoSayaController(),
    );
  }
}
