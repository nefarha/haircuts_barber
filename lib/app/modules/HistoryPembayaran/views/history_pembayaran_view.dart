import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haircuts_barber_aja/app/data/addon/reuseable.dart';

import '../controllers/history_pembayaran_controller.dart';

class HistoryPembayaranView extends GetView<HistoryPembayaranController> {
  const HistoryPembayaranView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: reusableAppbar(title: "History Pembayaran", enableBack: true),
      body: controller.obx(
        (paymentList) => Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: STATUS_PAYMENT.values
                      .map((e) => filterCard(status: e))
                      .toList(),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Flexible(
              child: ListView(
                children: paymentList!
                    .map((payment) =>
                        reusableHistoryPembayaranCard(model: payment))
                    .toList(),
              ),
            ),
          ],
        ),
        onEmpty: Center(
          child: Text(
            'Belum ada transaksi',
            style: headerStyle(),
          ),
        ),
        onLoading: const Center(
          child: CircularProgressIndicator(
            color: yellowColor,
          ),
        ),
      ),
    );
  }

  Widget filterCard({required STATUS_PAYMENT status}) {
    return Obx(
      () => GestureDetector(
        onTap: () {
          controller.pickFilter(status: status);
        },
        child: Card(
          color: status == controller.selectedStatus.value ? blackColor : null,
          elevation: 3,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              status.name,
              style: TextStyle(
                color: status == controller.selectedStatus.value
                    ? yellowColor
                    : null,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
