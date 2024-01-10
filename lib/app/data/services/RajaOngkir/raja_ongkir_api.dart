import 'package:dio/dio.dart';
import 'package:haircuts_barber_aja/app/data/model/city/city_model.dart';
import 'package:haircuts_barber_aja/app/data/model/province/province_model.dart';
import 'package:haircuts_barber_aja/app/data/services/RajaOngkir/i_raja_ongkir_repo.dart';

class RajaOngkirServices implements IRajaOngkirServices {
  Map<String, dynamic> headers = {'key': "0a9da36554cfa8683391b9c72b413988"};

  Dio get dio => Dio(
        BaseOptions(
          baseUrl: 'https://api.rajaongkir.com/starter',
          headers: headers,
        ),
      );
  var baseUrl = 'https://api.rajaongkir.com/starter';

  @override
  Future<List<ProvinceModel>> getAllProvince() async {
    var response = await dio.request('/province');

    var hasilResponse = response.data['rajaongkir']['results'] as List;
    return hasilResponse.map((e) => ProvinceModel.fromJson(e)).toList();
  }

  @override
  Future<List<CityModel>> getCityByProvinceId(
      {required String provinceId}) async {
    var response = await dio.request('/city?province=$provinceId');

    var hasilResponse = response.data['rajaongkir']['results'] as List;
    return hasilResponse.map((e) => CityModel.fromJson(e)).toList();
  }
}
