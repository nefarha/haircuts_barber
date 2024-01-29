import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:haircuts_barber_aja/app/data/model/chat/chat_model.dart';

part 'chat_room_model.freezed.dart';
part 'chat_room_model.g.dart';

@freezed
class ChatRoomModel with _$ChatRoomModel {
  const factory ChatRoomModel({
    required String id,
    required DateTime lastUpdate,
    required ChatModel? lastChat,
    required List<String> peopleInChat,
  }) = _ChatRoomModel;

  factory ChatRoomModel.fromJson(Map<String, dynamic> json) =>
      _$ChatRoomModelFromJson(json);
}
