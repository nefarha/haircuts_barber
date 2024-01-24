import 'package:get/get.dart';

import '../controllers/history_pembayaran_controller.dart';

class HistoryPembayaranBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HistoryPembayaranController>(
      () => HistoryPembayaranController(),
    );
  }
}
