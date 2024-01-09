import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haircuts_barber_aja/app/data/model/addon/reuseable.dart';
import 'package:haircuts_barber_aja/app/data/model/addon/validator.dart';
import 'package:haircuts_barber_aja/app/modules/Auth/controllers/auth_controller.dart';

class LoginView extends GetView<AuthController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final loginFormKey = GlobalKey<FormState>();
    return Scaffold(
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
                    'Selamat datang! Masuk dan mulai gayamu!',
                    style: headerStyle(),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  reuseTextfield(
                      hintText: 'email',
                      validator: (p0) => Validator.validateEmail(p0),
                      controlller: controller.emailController),
                  const SizedBox(
                    height: 10,
                  ),
                  reuseTextfield(
                    hintText: 'password',
                    validator: (p0) => Validator.validatePassword(p0),
                    controlller: controller.passwordController,
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
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        fixedSize: Size(
                          Get.width,
                          50,
                        ),
                        backgroundColor: blackColor),
                    onPressed: () async {
                      // if (loginFormKey.currentState!.validate()) {
                      //   buildLoading();
                      //   await controller.authC.signInUser(
                      //       email: controller.emailController.text,
                      //       password: controller.passwordController.text,
                      //       token: controller.token.value!);
                      // }
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        color: whiteColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
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
            const Text('Belum punya akun?'),
            const SizedBox(
              width: 10,
            ),
            TextButton(
              onPressed: () {
                controller.pageController.nextPage(
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.linear);
              },
              style: ButtonStyle(
                overlayColor:
                    MaterialStatePropertyAll(yellowColor.withOpacity(0.3)),
              ),
              child: const Text(
                'Daftar disini',
                style: TextStyle(color: yellowColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}