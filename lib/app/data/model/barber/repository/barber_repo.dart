import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:haircuts_barber_aja/app/data/addon/reuseable.dart';
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

  Future<List<BarberModel>> getBarberList() async {
    return _barberStore
        .get()
        .then((value) => value.docs.map((e) => e.data()).toList());
  }

  Future<List<BarberModel>> getTopBarberList() async {
    List<BarberModel> topList = await _barberStore.limit(5).get().then(
          (value) => value.docs
              .map(
                (e) => e.data(),
              )
              .toList(),
        );

    topList.sort(
      (a, b) => b.rating.toInt() - a.rating.toInt(),
    );

    return topList;
  }

  Future updateBarber({required BarberModel model}) async {
    try {
      _instance.runTransaction((transaction) async {
        final barberSnap = await transaction.get(_barberStore.doc(model.id));

        transaction.update(_barberStore.doc(model.id), model.toJson());
      });
    } catch (e) {
      buildErrorDialog(message: 'Message : $e');
    }
  }
}
