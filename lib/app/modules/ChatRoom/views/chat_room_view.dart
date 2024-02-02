import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:haircuts_barber_aja/app/data/addon/reuseable.dart';
import 'package:intl/intl.dart';

import '../controllers/chat_room_controller.dart';

class ChatRoomView extends GetView<ChatRoomController> {
  const ChatRoomView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: whiteColor,
          width: Get.width,
          height: Get.height,
        ),
        controller.obx(
          (state) => Scaffold(
            resizeToAvoidBottomInset: true,
            appBar: reusableAppbar(
                title: controller.state!.item2.name, enableBack: true),
            body: Center(
              child: SizedBox(
                width: Get.width,
                child: Column(
                  children: [
                    chatWidget(),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 0, 8, 4),
                      child: Row(
                        children: [
                          Flexible(
                            child: reuseTextfield(
                              hintText: 'masukkan isi pesan',
                              controlller: controller.chatController,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () async {
                              await controller.pushcHat();
                            },
                            child: const CircleAvatar(
                              backgroundColor: yellowColor,
                              child: Padding(
                                padding: EdgeInsets.all(8),
                                child: Icon(
                                  Icons.send,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          onLoading: Card(
            child: loadingIndicator(),
          ),
        ),
      ],
    );
  }

  Widget chatWidget() {
    return Flexible(
      child: Obx(
        () => GroupedListView(
          reverse: true,
          order: GroupedListOrder.DESC,
          elements: controller.listChat.value,
          groupBy: (element) {
            return DateTime(
              element.sendAt.year,
              element.sendAt.month,
              element.sendAt.day,
            );
          },
          groupHeaderBuilder: (element) => SizedBox(
            width: 100,
            child: Center(
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    DateFormat('yyyy MMMM dd').format(element.sendAt),
                  ),
                ),
              ),
            ),
          ),
          itemBuilder: (context, chatModel) => Align(
            alignment: chatModel.senderId != controller.user!.id
                ? Alignment.centerLeft
                : Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 5,
                color: chatModel.senderId != controller.user!.id
                    ? Colors.orange.shade200
                    : Colors.grey.shade200,
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  constraints: const BoxConstraints(
                    maxWidth: 200,
                  ),
                  child: Text(chatModel.text),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
