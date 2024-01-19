import 'package:get/get.dart';

import '../controllers/edit_toko_controller.dart';

class EditTokoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditTokoController>(
      () => EditTokoController(),
    );
  }
}
