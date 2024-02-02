import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:haircuts_barber_aja/app/data/model/chat/chat_model.dart';
import 'package:haircuts_barber_aja/app/data/model/chat_room/chat_room_model.dart';

class ChatRoomRepo {
  final _chatRoomStore =
      FirebaseFirestore.instance.collection('chatRoom').withConverter(
            fromFirestore: (snapshot, options) =>
                ChatRoomModel.fromJson(snapshot.data()!),
            toFirestore: (value, options) => value.toJson(),
          );

  CollectionReference<ChatModel> _chatStore({required String id}) =>
      _chatRoomStore.doc(id).collection('chat').withConverter(
            fromFirestore: (snapshot, options) =>
                ChatModel.fromJson(snapshot.data()!),
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

  Stream<List<ChatRoomModel>> getAllChatRoom({required String userId}) {
    return _chatRoomStore
        .where('peopleInChat', arrayContains: userId)
        .snapshots()
        .map((event) => event.docs.map((e) => e.data()).toList());
  }

  Future createRoom({required ChatRoomModel roomModel}) async {
    await _chatRoomStore.doc(roomModel.id).set(roomModel);
  }

  Future updateRoom({required ChatRoomModel roomModel}) async {
    await _chatRoomStore.doc(roomModel.id).update(roomModel.toJson());
  }

  Future pushChat(
      {required ChatModel chatModel, required String roomId}) async {
    var chatStore = _chatStore(id: roomId);
    await chatStore.doc(chatModel.id).set(
          chatModel,
        );
  }

  Stream<List<ChatModel>> readChat({required String roomId}) {
    var chatStore = _chatStore(id: roomId);
    return chatStore.snapshots().map(
          (event) => event.docs.map((e) => e.data()).toList(),
        );
  }
}
