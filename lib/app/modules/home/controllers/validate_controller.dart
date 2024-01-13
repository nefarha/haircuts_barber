import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haircuts_barber_aja/app/controllers/authentication_controller.dart';
import 'package:haircuts_barber_aja/app/controllers/user_controller.dart';
import 'package:haircuts_barber_aja/app/data/addon/reuseable.dart';
import 'package:haircuts_barber_aja/app/data/model/address/addressModel.dart';
import 'package:haircuts_barber_aja/app/data/model/city/city_model.dart';
import 'package:haircuts_barber_aja/app/data/model/province/province_model.dart';
import 'package:haircuts_barber_aja/app/data/model/user/repository/user_repo.dart';
import 'package:haircuts_barber_aja/app/data/model/user/userModel.dart';
import 'package:haircuts_barber_aja/app/data/services/RajaOngkir/raja_ongkir_api.dart';

class ValidateController extends GetxController {
  final userC = UserController.instance;
  final userRepo = UserRepo();
  final authC = AuthenticationController.instance;
  final rajaOngkir = RajaOngkirServices();
  var isLoading = false.obs;
  final provinceController = TextEditingController();
  final cityController = TextEditingController();
  final descController = TextEditingController();
  final phoneController = TextEditingController();

  RxList<ProvinceModel> allProvince = RxList.empty();
  RxList<CityModel> allCity = RxList();

  Rx<ACCOUNT_TYPE> selectedAccount = Rx(ACCOUNT_TYPE.USER);
  Rxn<ProvinceModel> selectedProvince = Rxn();
  Rxn<CityModel> selectedCity = Rxn();

  Future fectAllProvince() async {
    updateLoading(
      currentValue: isLoading,
      newValue: true,
      update: () => update(),
    );
    allProvince.value = await rajaOngkir.getAllProvince();
    updateLoading(
      currentValue: isLoading,
      newValue: false,
      update: () => update(),
    );
  }

  Future fecthaAllCityWithProvinceId({required String provinceId}) async {
    updateLoading(
      currentValue: isLoading,
      newValue: true,
      update: () => update(),
    );

    allCity.value =
        await rajaOngkir.getCityByProvinceId(provinceId: provinceId);
    updateLoading(
      currentValue: isLoading,
      newValue: false,
      update: () => update(),
    );
  }

  Future updateBio() async {
    updateLoading(
      currentValue: isLoading,
      newValue: true,
      update: () => update(),
    );
    AddressModel addressModel = AddressModel(
        alamat: descController.text,
        lat: 0,
        long: 0,
        province: selectedProvince.value!.toJson(),
        city: selectedCity.value!.toJson(),
        pinpointed: true,
        description: descController.text);

    UserModel user = userC.user.value!.copyWith(
      addressModel: addressModel.toJson(),
      phone: phoneController.text,
      accountType: selectedAccount.value.name,
    );
    // print(user.addressModel!.toJson());
    try {
      await userRepo.updateUser(userModel: user);
      updateLoading(
        currentValue: isLoading,
        newValue: false,
        update: () => update(),
      );
    } catch (e) {
      buildErrorDialog(message: 'Terjadi Masalah');
    }
    updateLoading(
      currentValue: isLoading,
      newValue: false,
      update: () => update(),
    );
  }

  @override
  void onInit() async {
    await fectAllProvince();
    super.onInit();
  }
}
