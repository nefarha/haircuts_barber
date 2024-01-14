import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haircuts_barber_aja/app/data/addon/reuseable.dart';
import 'package:haircuts_barber_aja/app/data/model/province/province_model.dart';

import '../controllers/buat_toko_controller.dart';

class BuatTokoView extends GetView<BuatTokoController> {
  const BuatTokoView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => stackWithLoadingIndicator(
        isLoading: controller.isLoading.value,
        children: [
          Scaffold(
            appBar: reusableAppbar(title: 'Buat Toko'),
            body: SingleChildScrollView(
              child: Form(
                key: controller.alamatFormKey,
                child: Column(
                  children: [
                    tambahGambar(),
                    const SizedBox(
                      height: 20,
                    ),
                    namaToko(),
                    const SizedBox(
                      height: 20,
                    ),
                    deskripsiToko(),
                    const SizedBox(
                      height: 20,
                    ),
                    tambahPaket(),
                    const SizedBox(
                      height: 20,
                    ),
                    alamatToko(),
                    const SizedBox(
                      height: 20,
                    ),
                    tipeToko(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: blackColor,
                              foregroundColor: blackColor.withOpacity(0.3)),
                          onPressed: () async {
                            if (controller.alamatFormKey.currentState!
                                .validate()) {
                              await controller.bukaToko();
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

  Widget tambahGambar() {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 250,
            width: Get.width,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const PageScrollPhysics(),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () async {
                      await controller.pickFile();
                    },
                    child: Container(
                      width: Get.width,
                      color: greyColor,
                      child: const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.camera_alt,
                              color: whiteColor,
                              size: 40,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Tambah Gambar',
                              style: TextStyle(
                                  color: whiteColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  ...controller.listGambar.map(
                    (path) => Container(
                      width: Get.width,
                      height: Get.height,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.contain,
                          image: FileImage(
                            File(path),
                          ),
                        ),
                      ),
                      child: Stack(
                        children: [
                          GestureDetector(
                            onTap: () {
                              controller.listGambar
                                  .removeWhere((element) => element == path);
                            },
                            child: const Card(
                              color: blackColor,
                              elevation: 3,
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.delete,
                                  color: whiteColor,
                                  size: 35,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text('Gambar diupload : ${controller.listGambar.length}'),
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

  Widget tambahPaket() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Tambah Paket (Nanti bisa diubah setelah toko terbuka)',
            style: headerStyle(),
          ),
          reuseTextfield(
            hintText: 'nama paket',
            validator: (p0) => p0!.isEmpty ? "mohon isi" : null,
            controlller: controller.namaPaketController,
          ),
          reuseTextfield(
              hintText: 'harga paket',
              validator: (p0) => p0!.isEmpty ? "mohon isi" : null,
              controlller: controller.hargaPaketController,
              inputType: TextInputType.number),
          reuseTextfield(
            hintText: 'deskripsi paket',
            textHeight: 2,
            validator: (p0) => p0!.isEmpty ? "mohon isi" : null,
            controlller: controller.deskripsiPaketController,
          ),
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

  Widget tipeToko() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pilih Tipe Barber',
              style: headerStyle(),
            ),
            const SizedBox(
              height: 10,
            ),
            ...BARBER_TYPE.values.map(
              (e) => RadioMenuButton(
                value: e,
                groupValue: controller.selectedTipeToko.value,
                onChanged: (value) {
                  controller.selectedTipeToko.value = value!;
                },
                child: Text(
                  e.name,
                  style: headerStyle(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
