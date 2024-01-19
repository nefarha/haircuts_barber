import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haircuts_barber_aja/app/data/addon/reuseable.dart';
import 'package:haircuts_barber_aja/app/data/model/province/province_model.dart';

import '../controllers/edit_toko_controller.dart';

class EditTokoView extends GetView<EditTokoController> {
  const EditTokoView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => stackWithLoadingIndicator(
        isLoading: controller.isLoading.value,
        children: [
          Scaffold(
            appBar: reusableAppbar(title: 'Buat Toko', enableBack: true),
            body: SingleChildScrollView(
              child: Form(
                key: controller.editFormKey,
                child: Column(
                  children: [
                    namaToko(),
                    const SizedBox(
                      height: 20,
                    ),
                    deskripsiToko(),
                    const SizedBox(
                      height: 20,
                    ),
                    alamatToko(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: blackColor,
                              foregroundColor: blackColor.withOpacity(0.3)),
                          onPressed: () async {
                            if (controller.editFormKey.currentState!
                                .validate()) {
                              await controller.updateToko();
                            }
                          },
                          child: const Text(
                            'Lanjut',
                            style: TextStyle(color: whiteColor),
                          ),
                        ),
                      ),
                    ),
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
    );
  }

  Widget namaToko() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Nama Toko',
            style: headerStyle(),
          ),
          reuseTextfield(
            hintText: 'nama toko',
            validator: (p0) => p0!.isEmpty ? "Mohon Isi" : null,
            controlller: controller.namaController,
          ),
        ],
      ),
    );
  }

  Widget deskripsiToko() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Deskripsi Toko',
            style: headerStyle(),
          ),
          reuseTextfield(
              hintText: 'deskripsi toko',
              textHeight: 4,
              validator: (p0) => p0!.isEmpty ? "Mohon Isi" : null,
              controlller: controller.deskripsiController),
        ],
      ),
    );
  }

  Widget alamatToko() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Pilih alamat BARBERSHOP-mu',
            style: headerStyle(),
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
            textEditingController: controller.provinsiController,
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
              textEditingController: controller.kotaController),
          const SizedBox(
            height: 10,
          ),
          reuseTextfield(
            hintText: 'deskripsi (patokan)',
            textHeight: 4,
            controlller: controller.deskripsiAlamatController,
            validator: (p0) => p0!.isEmpty ? 'mohon isi' : null,
          ),
          const SizedBox(
            height: 10,
          ),
          buildPinPoint(),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
