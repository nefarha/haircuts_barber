import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haircuts_barber_aja/app/controllers/user_controller.dart';
import 'package:haircuts_barber_aja/app/data/model/user/repository/user_repo.dart';
import 'package:haircuts_barber_aja/app/data/model/user/userModel.dart';

class EditInfoController extends GetxController {
  final userRepo = UserRepo();
  UserModel? get user => UserController.instance.user.value!;
  var isLoading = false.obs;

  final namaController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();

  String? validateEmail(String? value) {
    if (value!.isEmpty) {
      return 'mohon Isi email';
    } else if (!GetUtils.isEmail(value)) {
      return 'format email salah';
    } else {
      return null;
    }
  }

  @override
  void onInit() {
    namaController.text = user!.name;
    phoneController.text = user!.phone!;
    emailController.text = user!.email;
    super.onInit();
  }
}
