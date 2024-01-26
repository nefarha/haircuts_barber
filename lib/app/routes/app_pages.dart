import 'package:get/get.dart';

import '../data/midlewares/auth_middlewares.dart';
import '../modules/AccountInfo/bindings/account_info_binding.dart';
import '../modules/AccountInfo/views/account_info_view.dart';
import '../modules/Auth/bindings/auth_binding.dart';
import '../modules/Auth/views/auth_view.dart';
import '../modules/BuatToko/bindings/buat_toko_binding.dart';
import '../modules/BuatToko/views/buat_toko_view.dart';
import '../modules/Checkout/bindings/checkout_binding.dart';
import '../modules/Checkout/views/checkout_view.dart';
import '../modules/DetailToko/bindings/detail_toko_binding.dart';
import '../modules/DetailToko/views/detail_toko_view.dart';
import '../modules/EditAddress/bindings/edit_address_binding.dart';
import '../modules/EditAddress/views/edit_address_view.dart';
import '../modules/EditInfo/bindings/edit_info_binding.dart';
import '../modules/EditInfo/views/edit_info_view.dart';
import '../modules/EditToko/bindings/edit_toko_binding.dart';
import '../modules/EditToko/views/edit_toko_view.dart';
import '../modules/HistoryPembayaran/bindings/history_pembayaran_binding.dart';
import '../modules/HistoryPembayaran/views/history_pembayaran_view.dart';
import '../modules/PesanBarber/bindings/pesan_barber_binding.dart';
import '../modules/PesanBarber/views/pesan_barber_view.dart';
import '../modules/PhoneAuth/bindings/phone_auth_binding.dart';
import '../modules/PhoneAuth/views/phone_auth_view.dart';
import '../modules/TokoSaya/bindings/toko_saya_binding.dart';
import '../modules/TokoSaya/views/toko_saya_view.dart';
import '../modules/TokoSayaPesanan/bindings/toko_saya_pesanan_binding.dart';
import '../modules/TokoSayaPesanan/views/toko_saya_pesanan_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/checkValidatedPage.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
        name: _Paths.HOME,
        page: () => const CheckValidated(),
        binding: HomeBinding(),
        middlewares: [AuthMiddlewares(priority: 0)]),
    GetPage(
      name: _Paths.AUTH,
      page: () => const AuthView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.PHONE_AUTH,
      page: () => const PhoneAuthView(),
      binding: PhoneAuthBinding(),
    ),
    GetPage(
      name: _Paths.ACCOUNT_INFO,
      page: () => const AccountInfoView(),
      binding: AccountInfoBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_INFO,
      page: () => const EditInfoView(),
      binding: EditInfoBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_ADDRESS,
      page: () => const EditAddressView(),
      binding: EditAddressBinding(),
    ),
    GetPage(
      name: _Paths.TOKO_SAYA,
      page: () => const TokoSayaView(),
      binding: TokoSayaBinding(),
    ),
    GetPage(
      name: _Paths.BUAT_TOKO,
      page: () => const BuatTokoView(),
      binding: BuatTokoBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_TOKO,
      page: () => const EditTokoView(),
      binding: EditTokoBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_TOKO,
      page: () => const DetailTokoView(),
      binding: DetailTokoBinding(),
    ),
    GetPage(
      name: _Paths.PESAN_BARBER,
      page: () => const PesanBarberView(),
      binding: PesanBarberBinding(),
    ),
    GetPage(
      name: _Paths.CHECKOUT,
      page: () => const CheckoutView(),
      binding: CheckoutBinding(),
    ),
    GetPage(
      name: _Paths.HISTORY_PEMBAYARAN,
      page: () => const HistoryPembayaranView(),
      binding: HistoryPembayaranBinding(),
    ),
    GetPage(
      name: _Paths.TOKO_SAYA_PESANAN,
      page: () => const TokoSayaPesananView(),
      binding: TokoSayaPesananBinding(),
    ),
  ];
}
