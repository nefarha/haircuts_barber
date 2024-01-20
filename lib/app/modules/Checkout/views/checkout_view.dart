import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haircuts_barber_aja/app/data/addon/reuseable.dart';

import '../controllers/checkout_controller.dart';

class CheckoutView extends GetView<CheckoutController> {
  const CheckoutView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: reusableAppbar(title: "Checkout", enableBack: true),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: barberInfo(),
      ),
    );
  }

  Widget barberInfo() {
    return const ListTile(
      title: Text(
        'Nama Toko',
      ),
      subtitle: Text("data"),
    );
  }
}
