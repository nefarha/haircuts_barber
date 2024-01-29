import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:haircuts_barber_aja/app/data/addon/reuseable.dart';
import 'package:haircuts_barber_aja/app/data/model/user/userModel.dart';

class UserRepo {
  final _fireInstance = FirebaseFirestore.instance;

  final _userStore =
      FirebaseFirestore.instance.collection('users').withConverter(
            fromFirestore: (snapshot, options) =>
                UserModel.fromJson(snapshot.data()!),
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

  Future<UserModel?> readOneTimeUser({required String id}) {
    return _userStore.doc(id).get().then((event) => event.data());
  }

  Stream<UserModel?> readUser({required String id}) {
    return _userStore.doc(id).snapshots().map((event) => event.data());
  }

  Future updatePhone({required String id, required String phoneNumber}) async {
    await _userStore.doc(id).update({'phone': phoneNumber});
  }

  Future updateTokenUser({required String id, required String? token}) async {
    await _userStore.doc(id).update({'token': token});
  }

  Future updateUser({required UserModel userModel}) async {
    try {
      _fireInstance.runTransaction((transaction) async {
        var userDoc = _userStore.doc(userModel.id);
        var userRef = await transaction.get(userDoc);

        transaction.update(userRef.reference, userModel.toJson());
      });
    } catch (e) {
      buildErrorDialog(message: "Something error : $e");
    }
  }
}
