// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:freezed_annotation/freezed_annotation.dart';

part 'barberModel.freezed.dart';
part 'barberModel.g.dart';

@freezed
class BarberModel with _$BarberModel {
  const factory BarberModel({
    required String id,
    required String namaToko,
    required Map<String, dynamic> alamat,
    required num rating,
    required String ownerId,
    required String deskripsiToko,
    required List<Map<String, dynamic>> daftarPaket,
    required List daftarGambar,
    required String? shopType,
  }) = _BarberModel;

  factory BarberModel.fromJson(Map<String, dynamic> json) =>
      _$BarberModelFromJson(json);
}
