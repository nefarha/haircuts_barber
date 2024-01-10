import 'package:get/get.dart';
import 'package:haircuts_barber_aja/app/data/model/user/userModel.dart';

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

  static bool validateUser({required UserModel? user}) {
    if (user!.accountType == null) {
      return false;
    }
    if (user.addressModel == null) {
      return false;
    }

    return true;
  }

  static String? phoneValidator({required String number}) {
    if (number.isEmpty) {
      return "Mohon isi";
    } else if (!number.isPhoneNumber) {
      return "Format nomor salah";
    } else {
      return null;
    }
  }

  static String? phoneRegex({required String phone}) {
    var number = phone;
    if (number[0] == "0") {
      number = number.replaceFirst(RegExp(r'0'), '+62');
    }
    return null;
  }
}
