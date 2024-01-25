import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haircuts_barber_aja/app/data/addon/reuseable.dart';

import '../controllers/checkout_controller.dart';

class CheckoutView extends GetView<CheckoutController> {
  const CheckoutView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return stackWithLoadingIndicator(
      isLoading: controller.isLoading.value,
      children: [
        Scaffold(
          appBar: reusableAppbar(title: "Checkout", enableBack: true),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: SizedBox(
                width: Get.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Barber Info",
                      style: headerStyle(),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    barberInfo(),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Jadwal Info",
                      style: headerStyle(),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    timeInfo(),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Biaya",
                      style: headerStyle(),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    priceInfo(),
                    const SizedBox(
                      height: 20,
                    ),
                    reusableElevatedButton(
                      onPressed: () async {
                        await controller.createBill();
                      },
                      title: "Lanjut",
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget barberInfo() {
    return Column(
      children: [
        ListTile(
          contentPadding: const EdgeInsets.all(0),
          leading: const Icon(
            Icons.store,
            color: blackColor,
          ),
          title: Text(
            controller.bookingModel.barberName,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
          subtitle: const Text('Barbershop'),
        ),
        ListTile(
          contentPadding: const EdgeInsets.all(0),
          leading: const Icon(
            Icons.price_check,
            color: Colors.green,
          ),
          title: Text(
            controller.bookingModel.paketBarber.namaPaket,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
          trailing: Text(moneyFormat(
              money: controller.bookingModel.paketBarber.hargaPaket)),
          subtitle: const Text('Nama paket'),
        ),
        ListTile(
          contentPadding: const EdgeInsets.all(0),
          leading: const Icon(
            Icons.payment,
            color: Colors.red,
          ),
          title: Text(
            controller.bookingModel.paymentType,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
          subtitle: const Text('Pembayaran'),
        ),
      ],
    );
  }

  Widget timeInfo() {
    return Column(
      children: [
        ListTile(
          contentPadding: const EdgeInsets.all(0),
          leading: const Icon(
            Icons.calendar_month,
            color: Colors.blue,
          ),
          title: Text(
            reuseDateFormat(date: controller.bookingModel.tanggal),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
          subtitle: const Text('Jadwal'),
        ),
        ListTile(
          contentPadding: const EdgeInsets.all(0),
          leading: const Icon(
            Icons.timelapse,
            color: Colors.orange,
          ),
          title: Text(
            "${controller.bookingModel.jam}:00",
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
          subtitle: const Text('Jam'),
        ),
      ],
    );
  }

  Widget priceInfo() {
    return Column(
      children: [
        ListTile(
          contentPadding: const EdgeInsets.all(0),
          leading: const Icon(
            Icons.money,
            color: Colors.green,
          ),
          title: Text(
            moneyFormat(money: controller.bookingModel.paketBarber.hargaPaket),
          ),
          subtitle: const Text('Harga paket'),
        ),
        ListTile(
          contentPadding: const EdgeInsets.all(0),
          leading: const Icon(
            Icons.money,
            color: Colors.green,
          ),
          title: Text(
            moneyFormat(money: controller.bookingModel.tax),
          ),
          subtitle: const Text('Biaya layanan'),
        ),
        ListTile(
          contentPadding: const EdgeInsets.all(0),
          leading: const Icon(
            Icons.money,
            color: Colors.green,
          ),
          title: Text(
            moneyFormat(money: controller.bookingModel.totalPrice),
          ),
          subtitle: const Text('Total'),
        ),
      ],
    );
  }
}
