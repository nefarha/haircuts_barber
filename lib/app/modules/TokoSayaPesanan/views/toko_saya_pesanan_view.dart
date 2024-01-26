import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haircuts_barber_aja/app/data/addon/reuseable.dart';

import '../controllers/toko_saya_pesanan_controller.dart';

class TokoSayaPesananView extends GetView<TokoSayaPesananController> {
  const TokoSayaPesananView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => stackWithLoadingIndicator(
        isLoading: controller.isLoading.value,
        children: [
          Scaffold(
            appBar: reusableAppbar(
              title: "Pesanan Toko",
              enableBack: true,
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(45),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Obx(
                      () => Row(
                        children: STATUS_BOOKING.values
                            .map(
                              (e) => filterCard(
                                status: e.name,
                                onTap: () {
                                  controller.selectedFilter.value = e;
                                },
                                color: controller.selectedFilter.value == e
                                    ? blackColor
                                    : null,
                                textColor: controller.selectedFilter.value == e
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
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: controller.obx(
                (state) => controller.bookingList
                        .where((element) =>
                            element.status ==
                            controller.selectedFilter.value.name)
                        .isNotEmpty
                    ? Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Obx(
                            () => Flexible(
                              child: ListView.separated(
                                  itemBuilder: (context, index) {
                                    var bookingModel =
                                        controller.bookingList[index];

                                    return reuseBookingCard(
                                      model: bookingModel,
                                      onChanged: (p0) async {
                                        await controller.changeReminder(
                                            model: bookingModel);
                                      },
                                    );
                                  },
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(
                                        height: 20,
                                      ),
                                  itemCount: controller.bookingList
                                      .where((element) =>
                                          element.status ==
                                          controller.selectedFilter.value.name)
                                      .length),
                            ),
                          ),
                        ],
                      )
                    : Center(
                        child: Text(
                          'Tidak ada riwayat booking',
                          style: headerStyle(),
                        ),
                      ),
                onEmpty: Center(
                  child: Text(
                    'Tidak ada riwayat booking',
                    style: headerStyle(),
                  ),
                ),
                onLoading: loadingIndicator(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
