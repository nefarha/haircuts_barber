import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haircuts_barber_aja/app/data/addon/reuseable.dart';

import '../controllers/edit_info_controller.dart';

class EditInfoView extends GetView<EditInfoController> {
  const EditInfoView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => stackWithLoadingIndicator(
        isLoading: controller.isLoading.value,
        children: [
          Scaffold(
            appBar: reusableAppbar(title: 'Info Pribadi', enableBack: true),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    buildNamaEdit(),
                    const SizedBox(
                      height: 20,
                    ),
                    buildEmailEdit(),
                    const SizedBox(
                      height: 20,
                    ),
                    buildPhoneEdit(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildNamaEdit() {
    var enable = false.obs;
    var namaForm = GlobalKey<FormState>();
    return Form(
      key: namaForm,
      child: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nama',
              style: headerStyle(),
            ),
            reuseTextfield(
              hintText: 'nama',
              controlller: controller.namaController,
              validator: (p0) => p0!.isEmpty ? 'mohon isi nama' : null,
              enabled: enable.value,
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    enable.toggle();
                  },
                  child: const Card(
                    elevation: 3,
                    color: blackColor,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.edit,
                        color: whiteColor,
                      ),
                    ),
                  ),
                ),
                buildSaveButton(
                  enable: enable.value,
                  onTap: () async {
                    if (enable.value) {
                      if (namaForm.currentState!.validate()) {
                        updateLoading(
                            currentValue: controller.isLoading, newValue: true);
                        await controller.userRepo.updateUser(
                            userModel: controller.user!.copyWith(
                                name: controller.namaController.text));
                        enable.toggle();
                        updateLoading(
                            currentValue: controller.isLoading,
                            newValue: false);
                      }
                    }
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildEmailEdit() {
    var enable = false.obs;
    var emailForm = GlobalKey<FormState>();
    return Form(
      key: emailForm,
      child: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Email',
              style: headerStyle(),
            ),
            reuseTextfield(
              hintText: 'email',
              controlller: controller.emailController,
              validator: (p0) => controller.validateEmail(p0),
              enabled: enable.value,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPhoneEdit() {
    var enable = false.obs;
    var phoneForm = GlobalKey<FormState>();
    return Form(
      key: phoneForm,
      child: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nomor Hp',
              style: headerStyle(),
            ),
            reuseTextfield(
              hintText: 'nomor hp',
              controlller: controller.phoneController,
              validator: (p0) => p0!.isEmpty ? 'mohon isi nomor hp' : null,
              enabled: enable.value,
              inputType: TextInputType.phone,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSaveButton({required bool enable, void Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 3,
        color: enable ? blackColor : greyColor,
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: [
              Icon(
                Icons.save,
                color: whiteColor,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'simpan',
                style: TextStyle(color: whiteColor),
              )
            ],
          ),
        ),
      ),
    );
  }
}
