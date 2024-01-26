import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haircuts_barber_aja/app/controllers/user_controller.dart';
import 'package:haircuts_barber_aja/app/data/addon/reuseable.dart';
import 'package:haircuts_barber_aja/app/data/model/barber/barberModel.dart';
import 'package:haircuts_barber_aja/app/data/model/barber/repository/barber_repo.dart';
import 'package:haircuts_barber_aja/app/data/model/user/repository/user_repo.dart';
import 'package:haircuts_barber_aja/app/data/model/user/userModel.dart';
import 'package:haircuts_barber_aja/app/routes/app_pages.dart';

class TokoSayaController extends GetxController with StateMixin<BarberModel> {
  final userRepo = UserRepo();
  final barberRepo = BarberRepo();
  UserModel? get user => UserController.instance.user.value;

  var isExpanded = false.obs;

  Rxn<BarberModel> barberModel = Rxn();

  List<Map<String, dynamic>> get daftarActionButton => [
        {
          'title': 'Pesanan',
          'onTap': () {
            Get.toNamed(
              Routes.TOKO_SAYA_PESANAN,
            );
          },
          'icon': const Icon(
            Icons.work,
            color: blackColor,
          )
        },
        {
          'title': 'Edit',
          'onTap': () {
            Get.toNamed(Routes.EDIT_TOKO, arguments: barberModel.value);
          },
          'icon': const Icon(
            Icons.edit,
            color: blackColor,
          )
        },
        {
          'title': 'Atur Paket',
          'onTap': null,
          'icon': const Icon(
            Icons.account_tree_rounded,
            color: blackColor,
          )
        },
        {
          'title': 'Testimoni',
          'onTap': null,
          'icon': const Icon(
            Icons.comment,
            color: blackColor,
          )
        },
      ];

  Future updateBarber() async {
    barberModel.value =
        await barberRepo.readMyBarber(barberId: user!.barberId!);
  }

  @override
  void onInit() async {
    if (user?.barberId != null) {
      barberModel.value =
          await barberRepo.readMyBarber(barberId: user!.barberId!).then(
        (event) {
          change(
            event,
            status: RxStatus.success(),
          );
          return event;
        },
      );
    }
    super.onInit();
  }
}
