import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/shop_detail_controller.dart';

class ShopDetailView extends GetView<ShopDetailController> {
  const ShopDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ShopDetailView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ShopDetailView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
