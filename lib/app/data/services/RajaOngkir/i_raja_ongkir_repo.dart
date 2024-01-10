import 'package:haircuts_barber_aja/app/data/model/city/city_model.dart';
import 'package:haircuts_barber_aja/app/data/model/province/province_model.dart';

abstract class IRajaOngkirServices {
  Future<List<ProvinceModel>> getAllProvince();
  Future<List<CityModel>> getCityByProvinceId({required String provinceId});
}
