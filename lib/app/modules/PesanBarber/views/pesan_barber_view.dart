import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haircuts_barber_aja/app/data/addon/reuseable.dart';
import 'package:haircuts_barber_aja/app/routes/app_pages.dart';
import 'package:intl/intl.dart';

import '../controllers/pesan_barber_controller.dart';

class PesanBarberView extends GetView<PesanBarberController> {
  const PesanBarberView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: reusableAppbar(title: "", enableBack: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              const Text(
                'controller.model.barberName',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text("Pilih paket"),
              const SizedBox(
                height: 10,
              ),
              buildSelectService(),
              const SizedBox(
                height: 30,
              ),
              const Text("Pilih tanggal"),
              const SizedBox(
                height: 10,
              ),
              buildTanggalBooking(),
              buildJamBooking(),
              const SizedBox(
                height: 30,
              ),
              buildRadioPayment(),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: buildPay(),
    );
  }

  Widget buildSelectService() {
    return GestureDetector(
      onTap: () {
        Get.bottomSheet(
          Container(
            height: 400,
            color: blackColor,
            padding: const EdgeInsets.all(8),
            child: buildDaftarPaket(),
          ),
        );
      },
      child: Card(
        child: Container(
          height: 60,
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Colors.grey, width: 1),
              right: BorderSide(color: Colors.grey, width: 1),
              top: BorderSide(color: Colors.grey, width: 1),
              left: BorderSide(color: yellowColor, width: 5),
            ),
          ),
          child: Row(
            children: [
              const Flexible(
                child: Text(
                  'controller selectedPaket namaPaket',
                  style:
                      TextStyle(color: blackColor, fontWeight: FontWeight.bold),
                ),
              ),
              const Spacer(),
              Card(
                color: yellowColor.withOpacity(0.2),
                elevation: 0,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    moneyFormat(money: 20000),
                    style: const TextStyle(
                        color: yellowColor, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTanggalBooking() {
    return Card(
      color: blackColor,
      child: ListTile(
        onTap: () {
          showDatePicker(
            initialDate: DateTime.now(),
            context: Get.context!,
            firstDate: DateTime.now(),
            lastDate: DateTime(
              (DateTime.now().year + 1),
            ),
          );
        },
        trailing: const Icon(
          Icons.edit,
          color: whiteColor,
        ),
        title: Text(
          DateFormat(DateFormat.YEAR_MONTH_DAY).format(
            DateTime.now(),
          ),
          style: const TextStyle(
            color: whiteColor,
          ),
        ),
      ),
    );
  }

  Widget buildJamBooking() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          11,
          (index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: buildTimeChip(time: index),
          ),
        ),
      ),
    );
  }

  Widget buildTimeChip({required int time}) {
    return Obx(
      () => FilterChip(
        elevation: 3,
        backgroundColor: whiteColor,
        disabledColor: whiteColor,
        selectedColor: blackColor,
        selected: controller.selectedIndex.value == time,
        showCheckmark: false,
        label: Text(
          "${time + 10}:00WIB",
          style: TextStyle(
              color: controller.selectedIndex.value == time
                  ? yellowColor
                  : blackColor,
              fontWeight: FontWeight.bold),
        ),
        onSelected: (value) {
          controller.selectedIndex.value = time;
          controller.selectedTime.value = time + 10;
        },
      ),
    );
  }

  Widget buildRadioPayment() {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Pembayaran"),
          ...Payment.values.map(
            (e) => ListTile(
              contentPadding: const EdgeInsets.all(0),
              leading: Radio(
                value: e,
                groupValue: controller.selectedValue.value,
                onChanged: (value) {
                  controller.selectedValue.value = value!;
                },
              ),
              title: Text(
                "Via ${e.name}",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildPay() {
    return Container(
      height: 80,
      color: yellowColor,
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            moneyFormat(money: 2000),
            style: const TextStyle(
                color: whiteColor,
                fontWeight: FontWeight.bold,
                fontSize: 20,
                letterSpacing: 1),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: blackColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              shadowColor: blackColor,
              elevation: 3,
              fixedSize: const Size(150, 50),
            ),
            onPressed: () async {
              Get.toNamed(Routes.CHECKOUT);
            },
            child: const Text(
              "Bayar",
              style: TextStyle(color: whiteColor),
            ),
          )
        ],
      ),
    );
  }

  Widget buildDaftarPaket() {
    return ListView(
        children: List.generate(
      10,
      (index) => Card(
        elevation: 3,
        child: ListTile(
          leading: Radio(
            value: index,
            groupValue: controller.selectedPaket,
            onChanged: (value) {},
          ),
          title: const Text('e.namaPaket'),
          subtitle: Text(
            moneyFormat(money: 20000),
          ),
        ),
      ),
    ));
  }
}
