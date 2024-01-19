import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haircuts_barber_aja/app/data/addon/reuseable.dart';
import 'package:haircuts_barber_aja/app/data/model/province/province_model.dart';

import '../controllers/edit_address_controller.dart';

class EditAddressView extends GetView<EditAddressController> {
  const EditAddressView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => stackWithLoadingIndicator(children: [
        Scaffold(
          appBar: reusableAppbar(
              title: 'Isi Bio Data',
              enableBack: controller.enableButton.value != null
                  ? controller.enableButton.value!
                  : false),
          body: _ValidateForm(),
        ),
      ], isLoading: controller.isLoading.value),
    );
  }
}

class _ValidateForm extends GetView<EditAddressController> {
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
                          controller.selectedCity.value = null;

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
                                  child: Text(e.city_name),
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
                      reusableElevatedButton(
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              controller.updateBio();
                            }
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
