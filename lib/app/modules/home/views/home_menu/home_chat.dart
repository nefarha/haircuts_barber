import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haircuts_barber_aja/app/data/addon/reuseable.dart';
import 'package:haircuts_barber_aja/app/modules/home/controllers/home_controller.dart';

class HomeChat extends GetView<HomeController> {
  const HomeChat({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ListView.separated(
          itemBuilder: (context, index) => chatItemCard(index: index),
          separatorBuilder: (context, index) => const Divider(),
          itemCount: 20),
    );
  }

  Widget chatItemCard({required int index}) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      title: Text('Nama Pengguna ${index + 1}'),
      leading: const CircleAvatar(
        backgroundColor: yellowColor,
      ),
      trailing: const CircleAvatar(
        radius: 5,
        backgroundColor: Colors.red,
      ),
    );
  }
}
