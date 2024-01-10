import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haircuts_barber_aja/app/data/addon/reuseable.dart';
import 'package:haircuts_barber_aja/app/data/addon/validator.dart';
import 'package:haircuts_barber_aja/app/data/model/province/province_model.dart';
import 'package:haircuts_barber_aja/app/modules/home/controllers/validate_controller.dart';

class UnValidatedView extends GetView<ValidateController> {
  const UnValidatedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: reusableAppbar(title: 'Isi Bio Data'),
        body: Obx(
          () => stackWithLoadingIndicator(children: [
            _ValidateForm(),
          ], isLoading: controller.isLoading.value),
        ));
  }
}

class _ValidateForm extends GetView<ValidateController> {
  _ValidateForm({Key? key}) : super(key: key);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Obx(
      () => SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Pilih alamatmu (Rumah)',
                        style: headerStyle(),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      buildFormAddress(
                        onChanged: (p0) async {
                          ProvinceModel model = p0;
                          controller.selectedProvince.value = model;

                          await controller.fecthaAllCityWithProvinceId(
                              provinceId: model.province_id);
                        },
                        value: controller.selectedProvince.value,
                        items: controller.allProvince
                            .map(
                              (e) => DropdownMenuItem(
                                value: e,
                                child: Text(e.province),
                              ),
                            )
                            .toList(),
                        hint: "provinsi",
                        textEditingController: controller.provinceController,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      buildFormAddress(
                          value: controller.selectedCity.value,
                          onChanged: (p0) {
                            controller.selectedCity.value = p0;
                          },
                          items: controller.allCity
                              .map(
                                (e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(e.cityName),
                                ),
                              )
                              .toList(),
                          hint: "kota",
                          textEditingController: controller.cityController),
                      const SizedBox(
                        height: 10,
                      ),
                      reuseTextfield(
                        hintText: 'deskripsi (patokan)',
                        textHeight: 4,
                        controlller: controller.descController,
                        validator: (p0) => p0!.isEmpty ? 'mohon isi' : null,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      buildPinPoint(),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Pilih Akunmu',
                        style: headerStyle(),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      // Pick Role,
                      ...ACCOUNT_TYPE.values.map(
                        (e) => RadioListTile(
                          value: e,
                          groupValue: controller.selectedAccount.value,
                          onChanged: (value) {
                            controller.selectedAccount.value = value!;
                          },
                          title: Text(e.name),
                          subtitle: Text(e == ACCOUNT_TYPE.USER
                              ? 'Dengan memilih User, kamu akan bergabung untuk mencari Barbershop untuk dirimu'
                              : 'Dengan memilih Barber, kamu akan bergabung untuk membuka Barbershop bagi user'),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Nomor Hp',
                        style: headerStyle(),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      reuseTextfield(
                        hintText: 'nomor hp',
                        controlller: controller.phoneController,
                        validator: (p0) =>
                            Validator.phoneValidator(number: p0!),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      reusableElevatedButton(
                          onPressed: () async {
                            buildLoading();
                            var a =
                                await controller.rajaOngkir.getAllProvince();
                            print(a);
                            Get.until((route) => !Get.isDialogOpen!);
                            // if (formKey.currentState!.validate()) {}
                          },
                          title: "Lanjut"),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
