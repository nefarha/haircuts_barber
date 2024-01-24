import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:haircuts_barber_aja/app/data/model/payment/payment_model.dart';

class PaymentRepo {
  final _instance = FirebaseFirestore.instance;

  final _paymentStore =
      FirebaseFirestore.instance.collection('payment').withConverter(
            fromFirestore: (snapshot, options) =>
                PaymentModel.fromJson(snapshot.data()!),
            toFirestore: (value, options) => value.toJson(),
          );

  Future addPaymentToDatabase({required PaymentModel paymentModel}) async {
    await _paymentStore.doc(paymentModel.link_id.toString()).set(paymentModel);
  }
}
