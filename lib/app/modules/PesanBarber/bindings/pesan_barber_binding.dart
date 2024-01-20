import 'package:get/get.dart';

import '../controllers/pesan_barber_controller.dart';

class PesanBarberBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PesanBarberController>(
      () => PesanBarberController(),
    );
  }
}
