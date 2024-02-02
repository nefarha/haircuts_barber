import 'package:get/get.dart';
import 'package:haircuts_barber_aja/app/controllers/user_controller.dart';
import 'package:haircuts_barber_aja/app/data/model/chat_room/chat_room_model.dart';
import 'package:haircuts_barber_aja/app/data/model/chat_room/repo/chat_room_repo.dart';
import 'package:haircuts_barber_aja/app/data/model/user/userModel.dart';

class ChatController extends GetxController
    with StateMixin<List<ChatRoomModel>> {
  final chatRoomRepo = ChatRoomRepo();
  UserModel get user => UserController.instance.user.value!;
  RxList<ChatRoomModel> allListChat = RxList.empty();

  @override
  void onInit() {
    allListChat.bindStream(
      chatRoomRepo.getAllChatRoom(userId: user.id).asyncMap(
        (event) {
          if (event.isNotEmpty) {
            change(event, status: RxStatus.success());
          } else {
            change(event, status: RxStatus.empty());
          }

          return event;
        },
      ),
    );
    super.onInit();
  }
}
