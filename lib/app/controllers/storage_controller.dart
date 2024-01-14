import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';
import 'package:haircuts_barber_aja/app/data/addon/reuseable.dart';

class StorageController extends GetxController {
  static StorageController get instance => Get.find();

  final storageRef = FirebaseStorage.instance.ref();

  Future uploadProfilePicture({required String id, required File file}) async {
    try {
      final profilePath =
          storageRef.child('profilePicture/$id/profilePicture.png');

      var imageBytes = await FlutterImageCompress.compressWithList(
        file.readAsBytesSync(),
        quality: 20,
      );

      var fileFromUint8 = File('${file.path}_compressed.jpg');

      await fileFromUint8.writeAsBytes(imageBytes);

      // print("ini $fileFromUint8");

      await profilePath.putFile(fileFromUint8);
      var downloadUrl = await profilePath.getDownloadURL();
      return downloadUrl;
    } on FirebaseException catch (e) {
      buildErrorDialog(
          message:
              'Terjadi kesalahan dengan kode ${e.code}, dengan pesan ${e.message}');
    }
  }

  Future deleteProfilePicture({required String id}) async {
    try {
      await storageRef.child('profilePicture/$id/profilePicture.png').delete();
    } on FirebaseException catch (e) {
      buildErrorDialog(
          message:
              'Terjadi kesalahan dengan kode ${e.code}, dengan pesan ${e.message}');
    }
  }

  Future<List<String>> uploadBarberPicture(
      {required String id, required List<File> daftarGambar}) async {
    List<String> urls = [];
    try {
      for (var i = 0; i < daftarGambar.length; i++) {
        File gambar = daftarGambar[i];
        final profilePath = storageRef.child(
            'shops/$id/${DateTime.now().millisecondsSinceEpoch + i}.png');
        var imageBytes = await FlutterImageCompress.compressWithList(
          gambar.readAsBytesSync(),
          quality: 20,
        );

        var fileFromUint8 = File('${gambar.path}_compressed.jpg');

        await fileFromUint8.writeAsBytes(imageBytes);
        await profilePath.putFile(fileFromUint8);
        var downloadUrl = await profilePath.getDownloadURL();
        urls.add(downloadUrl);
      }
    } on FirebaseException catch (e) {
      buildErrorDialog(
          message:
              'Terjadi kesalahan dengan kode ${e.code}, dengan pesan ${e.message}');
    }
    return urls;
  }
}
