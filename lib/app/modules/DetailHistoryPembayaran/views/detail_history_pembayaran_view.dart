import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:haircuts_barber_aja/app/data/addon/reuseable.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controllers/detail_history_pembayaran_controller.dart';

class DetailHistoryPembayaranView
    extends GetView<DetailHistoryPembayaranController> {
  const DetailHistoryPembayaranView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: reusableAppbar(title: 'Detail Pembayaran', enableBack: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 3,
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ListTile(
                        leading: const Icon(
                          Icons.date_range,
                          color: greenColor,
                        ),
                        title: Text(
                          reuseDateFormat(
                              date: controller.paymentModel.createdAt),
                        ),
                        subtitle: const Text('Tanggal pembuatan'),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.panorama_fisheye,
                          color: statusPembayaranColor(
                              controller.paymentModel.status),
                        ),
                        title: Text(
                          controller.paymentModel.status,
                          style: TextStyle(
                            color: statusPembayaranColor(
                                controller.paymentModel.status),
                          ),
                        ),
                        subtitle: const Text('Status pembayaran'),
                      ),
                      ListTile(
                        leading: const Icon(
                          Icons.store,
                          color: blackColor,
                        ),
                        title: Text(
                          controller
                              .paymentModel.bookingModel!.barberStore.namaToko,
                        ),
                        subtitle: const Text('Nama toko'),
                      ),
                      ListTile(
                        leading: const Icon(
                          Icons.location_on,
                          color: yellowColor,
                        ),
                        title: Text(
                          controller.paymentModel.bookingModel!.barberStore
                              .alamat.alamat,
                        ),
                        subtitle: const Text('Alamat toko'),
                      ),
                      ListTile(
                        leading: const Icon(
                          Icons.money,
                          color: greenColor,
                        ),
                        title: Text(
                          moneyFormat(money: controller.paymentModel.amount),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              if (controller.paymentModel.status == STATUS_PAYMENT.ACTIVE.name)
                reusableElevatedButton(
                    onPressed: () {
                      launchUrl(Uri.parse(
                          'https://${controller.paymentModel.link_url}'));
                    },
                    title: "Bayar Sekarang")
            ],
          ),
        ),
      ),
    );
  }
}
