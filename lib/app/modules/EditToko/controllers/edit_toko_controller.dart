import 'package:file_picker/file_picker.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:haircuts_barber_aja/app/controllers/storage_controller.dart';
import 'package:haircuts_barber_aja/app/controllers/user_controller.dart';
import 'package:haircuts_barber_aja/app/data/addon/reuseable.dart';
import 'package:haircuts_barber_aja/app/data/model/address/addressModel.dart';
import 'package:haircuts_barber_aja/app/data/model/barber/barberModel.dart';
import 'package:haircuts_barber_aja/app/data/model/barber/repository/barber_repo.dart';
import 'package:haircuts_barber_aja/app/data/model/city/city_model.dart';
import 'package:haircuts_barber_aja/app/data/model/province/province_model.dart';
import 'package:haircuts_barber_aja/app/data/model/user/userModel.dart';
import 'package:haircuts_barber_aja/app/data/services/RajaOngkir/raja_ongkir_api.dart';

class EditTokoController extends GetxController {
  UserModel get user => UserController.instance.user.value!;
  Rx<BarberModel> model = Rx(Get.arguments);
  final rajaOngkir = RajaOngkirServices();
  final barberRepo = BarberRepo();
  final storageC = StorageController.instance;

  final editFormKey = GlobalKey<FormState>();
  final namaController = TextEditingController();
  final deskripsiController = TextEditingController();
  final provinsiController = TextEditingController();
  final kotaController = TextEditingController();
  final deskripsiAlamatController = TextEditingController();
  var selectedTipeToko = Rx<BARBER_TYPE>(BARBER_TYPE.BARBERSHOP);

  RxList<String> listGambar = RxList.empty();
  var isLoading = false.obs;

  RxList<ProvinceModel> allProvince = RxList.empty();
  RxList<CityModel> allCity = RxList();

  Rxn<ProvinceModel> selectedProvince = Rxn();
  Rxn<CityModel> selectedCity = Rxn();

  Future pickFile() async {
    var filePicker = await FilePicker.platform.pickFiles(allowMultiple: true);

    if (filePicker != null) {
      for (var element in filePicker.paths) {
        listGambar.add(element!);
      }
    }
  }

  Future updateToko() async {
    updateLoading(currentValue: isLoading, newValue: true);

    var address = AddressModel(
        alamat: "alamat",
        lat: 120,
        long: 120,
        province: selectedProvince.value!,
        city: selectedCity.value!,
        description: deskripsiAlamatController.text,
        pinpointed: true);

    BarberModel newModel = model.value.copyWith(
        namaToko: namaController.text,
        alamat: address,
        rating: 0,
        ownerId: user.id,
        deskripsiToko: deskripsiController.text,
        shopType: selectedTipeToko.value.name);

    await barberRepo.updateBarber(
      model: newModel,
    );
    updateLoading(currentValue: isLoading, newValue: false);
    Get.back();
    Get.back();
  }

  Future fectAllProvince() async {
    updateLoading(
      currentValue: isLoading,
      newValue: true,
    );
    allProvince.value = await rajaOngkir.getAllProvince();
    updateLoading(
      currentValue: isLoading,
      newValue: false,
    );
  }

  Future fecthaAllCityWithProvinceId({required String provinceId}) async {
    updateLoading(
      currentValue: isLoading,
      newValue: true,
    );

    allCity.value =
        await rajaOngkir.getCityByProvinceId(provinceId: provinceId);
    updateLoading(
      currentValue: isLoading,
      newValue: false,
    );
  }

  @override
  void onInit() async {
    await fectAllProvince();
    super.onInit();
  }
}
