import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haircuts_barber_aja/app/controllers/storage_controller.dart';
import 'package:haircuts_barber_aja/app/controllers/user_controller.dart';
import 'package:haircuts_barber_aja/app/data/addon/reuseable.dart';
import 'package:haircuts_barber_aja/app/data/model/address/addressModel.dart';
import 'package:haircuts_barber_aja/app/data/model/barber/barberModel.dart';
import 'package:haircuts_barber_aja/app/data/model/barber/repository/barber_repo.dart';
import 'package:haircuts_barber_aja/app/data/model/city/city_model.dart';
import 'package:haircuts_barber_aja/app/data/model/province/province_model.dart';
import 'package:haircuts_barber_aja/app/data/model/services/service_model.dart';
import 'package:haircuts_barber_aja/app/data/model/user/repository/user_repo.dart';
import 'package:haircuts_barber_aja/app/data/model/user/userModel.dart';
import 'package:haircuts_barber_aja/app/data/services/RajaOngkir/raja_ongkir_api.dart';
import 'package:haircuts_barber_aja/app/routes/app_pages.dart';

class BuatTokoController extends GetxController {
  UserModel? get user => UserController.instance.user.value!;
  final userRepo = UserRepo();
  final barberRepo = BarberRepo();
  var rajaOngkir = RajaOngkirServices();
  final storageC = StorageController.instance;

  final namaController = TextEditingController();
  final deskripsiController = TextEditingController();
  final provinsiController = TextEditingController();
  final kotaController = TextEditingController();
  final deskripsiAlamatController = TextEditingController();
  final namaPaketController = TextEditingController();
  final hargaPaketController = TextEditingController();
  final deskripsiPaketController = TextEditingController();

  final alamatFormKey = GlobalKey<FormState>();
  var isLoading = false.obs;
  RxList<String> listGambar = RxList.empty();

  var selectedTipeToko = Rx<BARBER_TYPE>(BARBER_TYPE.BARBERSHOP);

  RxList<ProvinceModel> allProvince = RxList.empty();
  RxList<CityModel> allCity = RxList();

  Rxn<ProvinceModel> selectedProvince = Rxn();
  Rxn<CityModel> selectedCity = Rxn();

  Future pickFile() async {
    var filePicker = await FilePicker.platform.pickFiles(allowMultiple: true);

    if (filePicker != null) {
      for (var element in filePicker.paths) {
        listGambar.add(element!);
      }
    }
  }

  Future fectAllProvince() async {
    updateLoading(
      currentValue: isLoading,
      newValue: true,
    );
    allProvince.value = await rajaOngkir.getAllProvince();
    updateLoading(
      currentValue: isLoading,
      newValue: false,
    );
  }

  Future fecthaAllCityWithProvinceId({required String provinceId}) async {
    updateLoading(
      currentValue: isLoading,
      newValue: true,
    );

    allCity.value =
        await rajaOngkir.getCityByProvinceId(provinceId: provinceId);
    updateLoading(
      currentValue: isLoading,
      newValue: false,
    );
  }

  Future bukaToko() async {
    updateLoading(
      currentValue: isLoading,
      newValue: true,
    );
    List<File> daftarFile = listGambar
        .map(
          (element) => File(element),
        )
        .toList();

    var address = AddressModel(
        alamat: "alamat",
        lat: 120,
        long: 120,
        province: selectedProvince.value!,
        city: selectedCity.value!,
        description: deskripsiAlamatController.text,
        pinpointed: true);

    var paket = ServiceModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      namaPaket: namaPaketController.text,
      deskripsi: deskripsiPaketController.text,
      hargaPaket: num.parse(hargaPaketController.text),
    );

    await storageC
        .uploadBarberPicture(id: user!.id, daftarGambar: daftarFile)
        .then(
      (value) async {
        var barberModel = BarberModel(
            id: user!.id + DateTime.now().microsecondsSinceEpoch.toString(),
            namaToko: namaController.text,
            alamat: address,
            rating: 0,
            ownerId: user!.id,
            deskripsiToko: deskripsiController.text,
            daftarPaket: [paket],
            daftarGambar: value,
            shopType: selectedTipeToko.value.name);

        await barberRepo.createBarber(
            barberId: barberModel.id, model: barberModel);
        await userRepo.updateUser(
            userModel: user!.copyWith(barberId: barberModel.id));
      },
    );

    Get.until(
      (route) => Get.currentRoute == Routes.ACCOUNT_INFO,
    );
  }

  @override
  void onInit() async {
    await fectAllProvince();
    super.onInit();
  }
}
