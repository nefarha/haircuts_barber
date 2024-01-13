import 'package:get/get.dart';
import 'package:haircuts_barber_aja/app/controllers/authentication_controller.dart';
import 'package:haircuts_barber_aja/app/controllers/firestore_controller.dart';
import 'package:haircuts_barber_aja/app/data/addon/validator.dart';
import 'package:haircuts_barber_aja/app/data/model/user/userModel.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();
  final authC = AuthenticationController.instance;
  final dataC = FirestoreController.instance;

  Rxn<UserModel> user = Rxn();
  RxnBool isValidated = RxnBool();

  @override
  void onInit() {
    user.bindStream(
      dataC.readUser(id: authC.currentUser.value!.uid).asyncMap(
        (user) {
          print(user);
          isValidated.value = Validator.validateUser(user: user!);
          return user;
        },
      ),
    );
    super.onInit();
  }
}
