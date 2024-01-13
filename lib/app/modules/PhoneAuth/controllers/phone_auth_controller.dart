import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:haircuts_barber_aja/app/controllers/authentication_controller.dart';
import 'package:haircuts_barber_aja/app/data/model/user/repository/user_repo.dart';

class PhoneAuthController extends GetxController {
  final authC = AuthenticationController.instance;
  final userRepo = UserRepo();
  final phoneController = TextEditingController();
}
