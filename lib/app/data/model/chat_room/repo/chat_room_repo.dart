import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:haircuts_barber_aja/app/data/model/chat_room/chat_room_model.dart';

class ChatRoomRepo {
  final _chatRoomStore =
      FirebaseFirestore.instance.collection('chatRoom').withConverter(
            fromFirestore: (snapshot, options) =>
                ChatRoomModel.fromJson(snapshot.data()!),
            toFirestore: (value, options) => value.toJson(),
          );

  Future<ChatRoomModel?> readChatRoom({required String userId}) async {
    var roomStore =
        await _chatRoomStore.where('peopleInChat', arrayContains: userId).get();

    if (roomStore.docs.isNotEmpty) {
      return roomStore.docs.first.data();
    }
    return null;
  }

  Future createRoom({required ChatRoomModel roomModel}) async {
    await _chatRoomStore.doc(roomModel.id).set(roomModel);
  }

  Future updateRoom({required ChatRoomModel roomModel}) async {
    await _chatRoomStore.doc(roomModel.id).update(roomModel.toJson());
  }
}
