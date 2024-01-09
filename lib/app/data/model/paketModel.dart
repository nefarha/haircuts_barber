// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PaketModel {
  String id;
  String namaPaket;
  String deskripsi;
  num hargaPaket;
  PaketModel({
    required this.id,
    required this.namaPaket,
    required this.deskripsi,
    required this.hargaPaket,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'namaPaket': namaPaket,
      'deskripsi': deskripsi,
      'hargaPaket': hargaPaket,
    };
  }

  factory PaketModel.fromMap(Map<String, dynamic> map) {
    return PaketModel(
      id: map['id'] as String,
      namaPaket: map['namaPaket'] as String,
      deskripsi: map['deskripsi'] as String,
      hargaPaket: map['hargaPaket'] as num,
    );
  }

  String toJson() => json.encode(toMap());

  factory PaketModel.fromJson(String source) =>
      PaketModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
