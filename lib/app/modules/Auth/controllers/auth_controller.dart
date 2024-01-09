import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:haircuts_barber_aja/app/data/model/address/addressModel.dart';

class AuthController extends GetxController {
  var token = RxnString();
  PageController pageController = PageController();

  Rxn<AddressModel> addressModel = Rxn();

  var isLoading = false.obs;

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
}
