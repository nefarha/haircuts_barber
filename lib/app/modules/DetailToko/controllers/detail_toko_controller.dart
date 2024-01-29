import 'package:get/get.dart';
import 'package:haircuts_barber_aja/app/controllers/user_controller.dart';
import 'package:haircuts_barber_aja/app/data/addon/reuseable.dart';
import 'package:haircuts_barber_aja/app/data/model/barber/barberModel.dart';
import 'package:haircuts_barber_aja/app/data/model/barber/repository/barber_repo.dart';
import 'package:haircuts_barber_aja/app/data/model/chat_room/chat_room_model.dart';
import 'package:haircuts_barber_aja/app/data/model/chat_room/repo/chat_room_repo.dart';
import 'package:haircuts_barber_aja/app/data/model/testimonial/repository/testimonial_repository.dart';
import 'package:haircuts_barber_aja/app/data/model/testimonial/testimonial.dart';
import 'package:haircuts_barber_aja/app/data/model/user/repository/user_repo.dart';
import 'package:haircuts_barber_aja/app/data/model/user/userModel.dart';
import 'package:tuple/tuple.dart';

class DetailTokoController extends GetxController
    with StateMixin<Tuple3<BarberModel?, UserModel?, List<TestiMonialModel>?>> {
  final barberRepo = BarberRepo();
  final userRepo = UserRepo();
  final chatRoomRepo = ChatRoomRepo();
  final testiRepo = TestimonialRepo();

  UserModel? get user => UserController.instance.user.value;
  Rxn<BarberModel> barberModel = Rxn();
  Rxn<UserModel> ownerModel = Rxn();
  RxList<TestiMonialModel> testiMonialList = RxList.empty();
  var isLoading = false.obs;

  Future moveToChatRoom() async {
    updateLoading(currentValue: isLoading, newValue: true);
    var result = await chatRoomRepo.readChatRoom(userId: user!.id);

    if (result != null) {
      print(result);
    } else {
      var newRoomModel = ChatRoomModel(
        id: "ChatRoom_${user!.id}_${ownerModel.value!.id}",
        lastUpdate: DateTime.now(),
        lastChat: null,
        peopleInChat: [user!.id, ownerModel.value!.id],
      );
    }
    updateLoading(currentValue: isLoading, newValue: false);
  }

  @override
  void onInit() async {
    change(
        Tuple3(
          barberModel.value =
              await barberRepo.getBarber(barberId: Get.arguments.id),
          ownerModel.value = await userRepo.readOneTimeUser(
            id: Get.arguments.ownerId,
          ),
          testiMonialList.value =
              await testiRepo.getBarberTestimonail(barberId: Get.arguments.id),
        ),
        status: RxStatus.success());

    super.onInit();
  }
}
