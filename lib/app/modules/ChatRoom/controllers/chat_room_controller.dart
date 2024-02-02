import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haircuts_barber_aja/app/controllers/user_controller.dart';
import 'package:haircuts_barber_aja/app/data/model/chat/chat_model.dart';
import 'package:haircuts_barber_aja/app/data/model/chat_room/chat_room_model.dart';
import 'package:haircuts_barber_aja/app/data/model/chat_room/repo/chat_room_repo.dart';
import 'package:haircuts_barber_aja/app/data/model/user/repository/user_repo.dart';
import 'package:haircuts_barber_aja/app/data/model/user/userModel.dart';
import 'package:haircuts_barber_aja/app/data/services/fcm/fcm_provider.dart';
import 'package:tuple/tuple.dart';

class ChatRoomController extends GetxController
    with StateMixin<Tuple2<ChatRoomModel, UserModel>> {
  final userRepo = UserRepo();
  final chatRoomRepo = ChatRoomRepo();
  final fcm = FCMProvider();

  UserModel? get user => UserController.instance.user.value;
  Rxn<ChatRoomModel> chatRoom = Rxn(Get.arguments[0]);
  RxList<ChatModel> listChat = RxList.empty();
  Rxn<UserModel> targetModel = Rxn();

  final TextEditingController chatController = TextEditingController();

  Future pushcHat() async {
    if (chatController.text.isNotEmpty || chatController.text != '') {
      var result = await chatRoomRepo.readChatRoom(userId: user!.id);

      if (result == null) {
        chatRoomRepo.createRoom(roomModel: chatRoom.value!);
      }

      var chatModel = ChatModel(
        id: '${user!.id}-${DateTime.now().millisecondsSinceEpoch}',
        text: chatController.text,
        senderId: user!.id,
        sendAt: DateTime.now(),
        isRead: false,
      );

      chatController.clear();
      await chatRoomRepo.pushChat(
          chatModel: chatModel, roomId: chatRoom.value!.id);
      await fcm.sendChat(
          title: "Pesan dari ${user!.name}",
          body: "Pesan baru diterima",
          fcmToken: targetModel.value!.token);
    }
  }

  @override
  void onInit() async {
    listChat.bindStream(chatRoomRepo.readChat(roomId: chatRoom.value!.id));
    targetModel.value = await userRepo
        .readOneTimeUser(
      id: Get.arguments[1],
    )
        .then(
      (value) {
        change(
          Tuple2(
            chatRoom.value!,
            value!,
          ),
          status: RxStatus.success(),
        );
        return value;
      },
    );

    super.onInit();
  }
}
