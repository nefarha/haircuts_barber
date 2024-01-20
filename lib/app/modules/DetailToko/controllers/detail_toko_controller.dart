import 'package:get/get.dart';
import 'package:haircuts_barber_aja/app/data/model/barber/barberModel.dart';
import 'package:haircuts_barber_aja/app/data/model/barber/repository/barber_repo.dart';

class DetailTokoController extends GetxController with StateMixin<BarberModel> {
  final barberRepo = BarberRepo();
  Rxn<BarberModel> barberModel = Rxn();

  @override
  void onInit() async {
    barberModel.value =
        await barberRepo.getBarber(barberId: Get.arguments).then((value) {
      change(value, status: RxStatus.success());
      return value;
    });
    super.onInit();
  }
}
