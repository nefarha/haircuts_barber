import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:haircuts_barber_aja/app/data/model/testimonial/testimonial.dart';

class TestimonialRepo {
  final _instance = FirebaseFirestore.instance;

  final _testimonialStore =
      FirebaseFirestore.instance.collection('testimonial').withConverter(
            fromFirestore: (snapshot, options) =>
                TestiMonialModel.fromJson(json: snapshot.data()!),
            toFirestore: (value, options) => value.toJson(),
          );

  Future<List<TestiMonialModel>> getBarberTestimonail(
      {required String barberId}) async {
    return _testimonialStore
        .where('barberId', isEqualTo: barberId)
        .get()
        .then((value) => value.docs.map((e) => e.data()).toList());
  }
}
