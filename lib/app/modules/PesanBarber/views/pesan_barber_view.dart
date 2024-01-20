import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/pesan_barber_controller.dart';

class PesanBarberView extends GetView<PesanBarberController> {
  const PesanBarberView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PesanBarberView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'PesanBarberView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
