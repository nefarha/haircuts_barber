import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:haircuts_barber_aja/app/data/model/barber/barberModel.dart';

class BarberRepo {
  final _instance = FirebaseFirestore.instance;

  final _barberStore =
      FirebaseFirestore.instance.collection('barber').withConverter(
            fromFirestore: (snapshot, options) =>
                BarberModel.fromJson(snapshot.data()!),
            toFirestore: (value, options) => value.toJson(),
          );

  Stream<BarberModel?> readMyBarber({required String barberId}) {
    return _barberStore.doc(barberId).snapshots().map((event) => event.data());
  }

  Future createBarber(
      {required String barberId, required BarberModel model}) async {
    await _barberStore.doc(barberId).set(model);
  }
}
