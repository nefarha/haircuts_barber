import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:haircuts_barber_aja/app/controllers/storage_controller.dart';
import 'package:haircuts_barber_aja/app/controllers/user_controller.dart';
import 'package:haircuts_barber_aja/app/data/addon/reuseable.dart';
import 'package:haircuts_barber_aja/app/data/model/user/repository/user_repo.dart';
import 'package:haircuts_barber_aja/app/data/model/user/userModel.dart';

class AccountInfoController extends GetxController {
  UserModel get user => UserController.instance.user.value!;
  final storageC = StorageController.instance;
  final userRepo = UserRepo();
  final isLoading = false.obs;

  Future pickAndUploadProfile() async {
    closeDialog();
    final pickedData =
        await FilePicker.platform.pickFiles(allowMultiple: false);
    if (pickedData != null) {
      updateLoading(currentValue: isLoading, newValue: true);
      File file = File(pickedData.files.first.path!);
      var hasil = await storageC.uploadProfilePicture(id: user.id, file: file);
      if (hasil != null) {
        await userRepo.updateUser(userModel: user.copyWith(profileUrl: hasil));
        updateLoading(currentValue: isLoading, newValue: false);
      }
      updateLoading(currentValue: isLoading, newValue: false);
    } else {}
  }

  Future deleteProfilePicture() async {
    closeDialog();
    updateLoading(currentValue: isLoading, newValue: true);
    await storageC.deleteProfilePicture(id: user.id);
    await userRepo.updateUser(userModel: user.copyWith(profileUrl: null));

    updateLoading(currentValue: isLoading, newValue: false);
  }
}
