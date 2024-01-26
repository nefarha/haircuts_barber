import 'package:get/get.dart';

import '../controllers/detail_history_pembayaran_controller.dart';

class DetailHistoryPembayaranBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailHistoryPembayaranController>(
      () => DetailHistoryPembayaranController(),
    );
  }
}
