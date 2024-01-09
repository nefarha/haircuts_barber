import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:haircuts_barber_aja/app/controllers/authentication_controller.dart';
import 'package:haircuts_barber_aja/app/data/model/address/addressModel.dart';

class AuthController extends GetxController {
  final authC = AuthenticationController.instance;
  var token = RxnString();
  PageController pageController = PageController();

  Rxn<AddressModel> addressModel = Rxn();

  var isLoading = false.obs;

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
}
