import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:haircuts_barber_aja/app/data/model/city/city_model.dart';
import 'package:haircuts_barber_aja/app/data/model/province/province_model.dart';
import 'package:haircuts_barber_aja/app/data/services/RajaOngkir/i_raja_ongkir_repo.dart';

class RajaOngkirServices implements IRajaOngkirServices {
  @override
  Future<List<ProvinceModel>> getAllProvince() async {
    final result =
        await rootBundle.loadString('assets/json/province_json.json');

    var hasilDecode = await json.decode(result);
    var hasil = hasilDecode['data']['result'] as List;
    return hasil.map((e) => ProvinceModel.fromJson(e)).toList();
  }

  @override
  Future<List<CityModel>> getCityByProvinceId(
      {required String provinceId}) async {
    final result = await rootBundle.loadString('assets/json/city_json.json');

    var hasilDecode = await json.decode(result);
    var hasil = hasilDecode['data']['result'] as List;
    List<CityModel> cityResult = hasil
        .map((e) => CityModel.fromJson(e))
        .where((element) => element.province_id == provinceId)
        .toList();
    return cityResult;
  }
}
