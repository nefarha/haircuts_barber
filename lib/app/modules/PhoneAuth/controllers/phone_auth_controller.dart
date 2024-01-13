import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:haircuts_barber_aja/app/controllers/authentication_controller.dart';
import 'package:haircuts_barber_aja/app/controllers/firestore_controller.dart';

class PhoneAuthController extends GetxController {
  final authC = AuthenticationController.instance;
  final dataC = FirestoreController.instance;
  final phoneController = TextEditingController();
}
