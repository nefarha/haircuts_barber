// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:haircuts_barber_aja/app/data/model/address/addressModel.dart';
import 'package:haircuts_barber_aja/app/data/model/services/service_model.dart';

part 'barberModel.freezed.dart';
part 'barberModel.g.dart';

@freezed
class BarberModel with _$BarberModel {
  const factory BarberModel({
    required String id,
    required String namaToko,
    required AddressModel alamat,
    required num rating,
    required String ownerId,
    required String deskripsiToko,
    required List<ServiceModel> daftarPaket,
    required List daftarGambar,
    required String? shopType,
  }) = _BarberModel;

  factory BarberModel.fromJson(Map<String, dynamic> json) =>
      _$BarberModelFromJson(json);
}
