import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:haircuts_barber_aja/app/data/addon/reuseable.dart';
import 'package:haircuts_barber_aja/app/data/model/user/userModel.dart';

class FirestoreController extends GetxController {
  static FirestoreController get instance => Get.find();

  final _userStore =
      FirebaseFirestore.instance.collection('users').withConverter(
            fromFirestore: (snapshot, options) =>
                UserModel.fromJson(json: snapshot.data()!),
            toFirestore: (value, options) => value.toJson(),
          );

  // User Session
  Future createUser({required UserModel model}) async {
    try {
      await _userStore.doc(model.id).set(model);
    } catch (e) {
      buildErrorDialog(message: e.toString());
    }
  }
}
