import 'package:get/get.dart';
import 'package:haircuts_barber_aja/app/controllers/user_controller.dart';
import 'package:haircuts_barber_aja/app/data/model/barber/barberModel.dart';
import 'package:haircuts_barber_aja/app/data/model/barber/repository/barber_repo.dart';
import 'package:haircuts_barber_aja/app/data/model/user/userModel.dart';

class BarberController extends GetxController
    with StateMixin<List<BarberModel>> {
  final barberRepo = BarberRepo();
  UserModel? get user => UserController.instance.user.value;
  RxList<BarberModel> topRatedBarberList = RxList.empty();
  RxList<BarberModel> topRatedSameCityBarberList = RxList.empty();

  Future pullRefresh() async {
    topRatedBarberList.value = await barberRepo.getTopBarberList();
  }

  @override
  void onInit() async {
    topRatedBarberList.value = await barberRepo.getTopBarberList().then(
      (value) {
        if (value.isNotEmpty) {
          change(
            value,
            status: RxStatus.success(),
          );
        } else {
          change(
            value,
            status: RxStatus.empty(),
          );
        }
        return value;
      },
    );

    super.onInit();
  }
}
