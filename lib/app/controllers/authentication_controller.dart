import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:haircuts_barber_aja/app/controllers/firestore_controller.dart';
import 'package:haircuts_barber_aja/app/data/addon/reuseable.dart';
import 'package:haircuts_barber_aja/app/data/model/user/userModel.dart';
import 'package:haircuts_barber_aja/app/routes/app_pages.dart';

class AuthenticationController extends GetxController {
  static AuthenticationController get instance => Get.find();
  final dataC = FirestoreController.instance;

  final _instance = FirebaseAuth.instance;

  Rx<User?> get currentUser => Rx(_instance.currentUser);

  // Stream User
  Stream<User?> userStateStream() => _instance.authStateChanges();

  Future registerUser({
    required String email,
    required String password,
    required String nama,
    required UserModel model,
  }) async {
    buildLoading();
    try {
      var userCred = await _instance.createUserWithEmailAndPassword(
          email: email, password: password);

      await userCred.user!.updateDisplayName(nama);
      await dataC.createUser(model: model.copyWith(id: userCred.user!.uid));
      Get.offAllNamed(Routes.HOME);
    } on FirebaseAuthException catch (e) {
      Get.until((route) => !Get.isDialogOpen!);
      buildErrorDialog(message: "${e.code} message ${e.message} ");
      return null;
    }
  }

  Future loginUser({
    required String email,
    required String password,
  }) async {
    buildLoading();
    try {
      var userCred = await _instance.signInWithEmailAndPassword(
          email: email, password: password);
      Get.offAllNamed(Routes.HOME);
    } on FirebaseAuthException catch (e) {
      Get.until((route) => !Get.isDialogOpen!);
      buildErrorDialog(message: "${e.code} message ${e.message} ");
    }
  }

  Future logout() async {
    buildLoading();
    try {
      await _instance.signOut();
      Get.offAllNamed(Routes.AUTH);
    } on FirebaseAuthException catch (e) {
      Get.until((route) => !Get.isDialogOpen!);
      buildErrorDialog(message: "${e.code} message ${e.message} ");
    }
  }
}
