import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haircuts_barber_aja/app/data/addon/reuseable.dart';
import 'package:haircuts_barber_aja/app/data/addon/validator.dart';
import 'package:haircuts_barber_aja/app/modules/Auth/controllers/auth_controller.dart';

class RegisterView extends GetView<AuthController> {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    final loginFormKey = GlobalKey<FormState>();
    return Obx(
      () => stackWithLoadingIndicator(
        isLoading: controller.isLoading.value,
        children: [
          Scaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Center(
                child: Form(
                  key: loginFormKey,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Daftarkan dirimu dan mulai atur gayamu!',
                          style: headerStyle(),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        reuseTextfield(
                          hintText: 'nama',
                          controlller: controller.nameController,
                          validator: (p0) =>
                              p0!.isEmpty ? 'mohon isi nama' : null,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        reuseTextfield(
                          hintText: 'email',
                          controlller: controller.emailController,
                          validator: (p0) => Validator.validateEmail(p0),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        reuseTextfield(
                          hintText: 'password',
                          controlller: controller.passwordController,
                          validator: (p0) => Validator.validatePassword(p0),
                          isObscured: true,
                          enableIcon: true,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              overlayColor: MaterialStatePropertyAll(
                                  blackColor.withOpacity(0.3)),
                            ),
                            child: const Text(
                              'lupa password?',
                              style: TextStyle(color: blackColor),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        reusableElevatedButton(
                            onPressed: () async {
                              if (loginFormKey.currentState!.validate()) {
                                await controller.registerUser();
                              }
                            },
                            title: "Register"),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            bottomNavigationBar: Container(
              width: Get.width,
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Sudah punya akun?'),
                  const SizedBox(
                    width: 10,
                  ),
                  TextButton(
                    onPressed: () {
                      controller.pageController.previousPage(
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.linear);
                    },
                    style: ButtonStyle(
                      overlayColor: MaterialStatePropertyAll(
                          yellowColor.withOpacity(0.3)),
                    ),
                    child: const Text(
                      'Masuk disini',
                      style: TextStyle(color: yellowColor),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
