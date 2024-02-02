import 'package:get/get.dart';
import 'package:haircuts_barber_aja/app/controllers/user_controller.dart';
import 'package:haircuts_barber_aja/app/modules/ChatRoom/controllers/chat_room_controller.dart';
import 'package:haircuts_barber_aja/app/modules/home/controllers/barber_controller.dart';
import 'package:haircuts_barber_aja/app/modules/home/controllers/validate_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      UserController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<ValidateController>(
      () => ValidateController(),
    );
    Get.lazyPut<BarberController>(
      () => BarberController(),
    );
    Get.lazyPut<ChatRoomController>(
      () => ChatRoomController(),
    );
  }
}
