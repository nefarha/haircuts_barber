import 'package:get/get.dart';
import 'package:haircuts_barber_aja/app/data/model/barber/barberModel.dart';
import 'package:haircuts_barber_aja/app/data/model/barber/repository/barber_repo.dart';
import 'package:haircuts_barber_aja/app/data/model/testimonial/repository/testimonial_repository.dart';
import 'package:haircuts_barber_aja/app/data/model/testimonial/testimonial.dart';
import 'package:haircuts_barber_aja/app/data/model/user/repository/user_repo.dart';
import 'package:haircuts_barber_aja/app/data/model/user/userModel.dart';
import 'package:tuple/tuple.dart';

class DetailTokoController extends GetxController
    with StateMixin<Tuple3<BarberModel?, UserModel?, List<TestiMonialModel>?>> {
  final barberRepo = BarberRepo();
  final userRepo = UserRepo();
  final testiRepo = TestimonialRepo();
  Rxn<BarberModel> barberModel = Rxn();
  Rxn<UserModel> ownerModel = Rxn();
  RxList<TestiMonialModel> testiMonialList = RxList.empty();

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
