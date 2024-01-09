import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:haircuts_barber_aja/app/data/addon/reuseable.dart';
import 'package:haircuts_barber_aja/app/routes/app_pages.dart';

class AuthenticationController extends GetxController {
  static AuthenticationController get instance => Get.find();

  final _instance = FirebaseAuth.instance;

  Rx<User?> get currentUser => Rx(_instance.currentUser);

  // Stream User
  Stream<User?> userStateStream() => _instance.authStateChanges();

  Future registerUser(
      {required String email,
      required String password,
      required String nama}) async {
    buildLoading();
    try {
      var userCred = await _instance.createUserWithEmailAndPassword(
          email: email, password: password);

      await userCred.user!.updateDisplayName(nama);
      Get.offAllNamed(Routes.HOME);
    } on FirebaseAuthException catch (e) {
      Get.until((route) => !Get.isDialogOpen!);
      buildErrorDialog(message: "${e.code} message ${e.message} ");
    }
  }

  Future loginUser({
    required String email,
    required String password,
  }) async {
    buildLoading();
    try {
      await _instance.signInWithEmailAndPassword(
          email: email, password: password);
      Get.offAllNamed(Routes.HOME);
    } on FirebaseAuthException catch (e) {
      Get.until((route) => !Get.isDialogOpen!);
      buildErrorDialog(message: "${e.code} message ${e.message} ");
    }
  }
}
