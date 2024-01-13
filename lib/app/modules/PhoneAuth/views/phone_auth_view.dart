import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haircuts_barber_aja/app/data/addon/reuseable.dart';
import 'package:haircuts_barber_aja/app/data/addon/validator.dart';

import '../controllers/phone_auth_controller.dart';

class PhoneAuthView extends GetView<PhoneAuthController> {
  const PhoneAuthView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: reusableAppbar(title: "Nomor Hp"),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              reuseTextfield(
                hintText: 'nomor hp',
                controlller: controller.phoneController,
                validator: (p0) => Validator.phoneValidator(number: p0!),
              ),
              const SizedBox(
                height: 20,
              ),
              reusableElevatedButton(
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      await controller.authC.phoneAuthSignIn(
                          phoneNumber: Validator.phoneRegex(
                              phone: controller.phoneController.text),
                          token: "token",
                          dataC: controller.userRepo,
                          id: controller.authC.currentUser.value!.uid);
                    }
                  },
                  title: "lanjut")
            ],
          ),
        ),
      ),
    );
  }
}
