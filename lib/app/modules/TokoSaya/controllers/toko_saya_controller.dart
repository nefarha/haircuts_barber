import 'package:get/get.dart';
import 'package:haircuts_barber_aja/app/controllers/user_controller.dart';
import 'package:haircuts_barber_aja/app/data/model/barber/barberModel.dart';
import 'package:haircuts_barber_aja/app/data/model/barber/repository/barber_repo.dart';
import 'package:haircuts_barber_aja/app/data/model/user/repository/user_repo.dart';
import 'package:haircuts_barber_aja/app/data/model/user/userModel.dart';

class TokoSayaController extends GetxController with StateMixin<BarberModel> {
  final userRepo = UserRepo();
  final barberRepo = BarberRepo();
  UserModel? get user => UserController.instance.user.value;

  var isExpanded = false.obs;

  Rxn<BarberModel> barberModel = Rxn();

  List<Map<String, dynamic>> get daftarPopUp => [
        {
          'title': 'Edit',
          'onTap': () {
            // Get.toNamed(Routes.EDIT_TOKO, arguments: barberModel.value);
          },
        },
        {
          'title': 'Atur Paket',
          'onTap': null,
        },
        {
          'title': 'Testimoni',
          'onTap': null,
        },
      ];

  @override
  void onInit() {
    if (user?.barberId != null) {
      barberModel.bindStream(
        barberRepo.readMyBarber(barberId: user!.barberId!).map(
          (event) {
            change(
              event,
              status: RxStatus.success(),
            );
            return event;
          },
        ),
      );
    }
    super.onInit();
  }
}
