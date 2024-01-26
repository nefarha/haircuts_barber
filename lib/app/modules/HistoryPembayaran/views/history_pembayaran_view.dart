import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haircuts_barber_aja/app/data/addon/reuseable.dart';
import 'package:haircuts_barber_aja/app/routes/app_pages.dart';

import '../controllers/history_pembayaran_controller.dart';

class HistoryPembayaranView extends GetView<HistoryPembayaranController> {
  const HistoryPembayaranView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: reusableAppbar(
        title: "History Pembayaran",
        enableBack: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(45),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: STATUS_PAYMENT.values
                    .map(
                      (e) => filterCard(
                        status: e.name,
                        onTap: () {
                          controller.selectedStatus.value = e;
                        },
                        color: controller.selectedStatus.value == e
                            ? blackColor
                            : null,
                        textColor: controller.selectedStatus.value == e
                            ? yellowColor
                            : null,
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ),
      ),
      body: controller.obx(
        (paymentList) => Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            Flexible(
              child: Obx(
                () {
                  paymentList!.sort(
                    (a, b) => b.createdAt.compareTo(a.createdAt),
                  );
                  return paymentList
                          .where((e) =>
                              e.status == controller.selectedStatus.value.name)
                          .isNotEmpty
                      ? ListView(
                          children: paymentList
                              .where((e) =>
                                  e.status ==
                                  controller.selectedStatus.value.name)
                              .map(
                                (payment) => reusableHistoryPembayaranCard(
                                    onTap: () => Get.toNamed(
                                        Routes.DETAIL_HISTORY_PEMBAYARAN,
                                        arguments: payment),
                                    model: payment),
                              )
                              .toList(),
                        )
                      : Center(
                          child: Text(
                            'Tidak Transaksi',
                            style: headerStyle(),
                          ),
                        );
                },
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
        onLoading: loadingIndicator(),
      ),
    );
  }
}
