import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:haircuts_barber_aja/app/controllers/authentication_controller.dart';
import 'package:haircuts_barber_aja/app/data/model/address/addressModel.dart';
import 'package:haircuts_barber_aja/app/data/model/user/repository/user_repo.dart';
import 'package:haircuts_barber_aja/app/data/model/user/userModel.dart';

class AuthController extends GetxController {
  final authC = AuthenticationController.instance;
  final userRepo = UserRepo();

  var token = RxnString();
  PageController pageController = PageController();

  Rxn<AddressModel> addressModel = Rxn();

  var isLoading = false.obs;

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future registerUser() async {
    UserModel model = UserModel(
        id: "id",
        name: nameController.text,
        email: emailController.text,
        token: "token");

    await authC.registerUser(
        email: emailController.text,
        password: passwordController.text,
        nama: nameController.text,
        model: model);
  }
}
