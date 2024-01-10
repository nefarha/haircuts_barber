import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haircuts_barber_aja/app/data/addon/reuseable.dart';
import 'package:haircuts_barber_aja/app/data/model/city/city_model.dart';
import 'package:haircuts_barber_aja/app/data/model/province/province_model.dart';
import 'package:haircuts_barber_aja/app/data/services/RajaOngkir/raja_ongkir_api.dart';

class ValidateController extends GetxController {
  final rajaOngkir = RajaOngkirServices();
  var isLoading = false.obs;
  // Address Controller
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
    _updateLoading(true);
    allProvince.value = await rajaOngkir.getAllProvince();
    _updateLoading(false);
  }

  Future fecthaAllCityWithProvinceId({required String provinceId}) async {
    _updateLoading(true);
    allCity.value =
        await rajaOngkir.getCityByProvinceId(provinceId: provinceId);
    _updateLoading(false);
  }

  _updateLoading(bool value) {
    isLoading.value = value;
    update();
  }

  @override
  void onInit() async {
    await fectAllProvince();
    super.onInit();
  }
}
