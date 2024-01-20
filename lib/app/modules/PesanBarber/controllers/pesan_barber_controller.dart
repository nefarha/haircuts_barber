import 'package:get/get.dart';

enum Payment { ONLINE, CASH }

class PesanBarberController extends GetxController {
  var selectedValue = Payment.values.first.obs;

  var selectedPaket = '';

  var selectedDate = Rx(DateTime.now());
  var selectedIndex = 0.obs;
  var selectedTime = Rxn<int>();
}
