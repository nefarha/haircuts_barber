import 'package:get/get.dart';

class Validator {
  static String? validateEmail(String? value) {
    if (value!.isEmpty) {
      return 'mohon Isi email';
    } else if (!GetUtils.isEmail(value)) {
      return 'format email salah';
    } else {
      return null;
    }
  }

  static String? validatePassword(String? value) {
    if (value!.isEmpty) {
      return 'mohon isi password';
    } else if (value.length < 8) {
      return "password terlalu pendek";
    } else {
      return null;
    }
  }
}
