import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haircuts_barber_aja/app/controllers/user_controller.dart';
import 'package:haircuts_barber_aja/app/modules/home/views/home_view.dart';
import 'package:haircuts_barber_aja/app/modules/home/views/validation_page.dart';

class CheckValidated extends GetView<UserController> {
  const CheckValidated({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => (controller.isValidated.value != false)
          ? const HomeView()
          : const UnValidatedView(),
    );
  }
}
