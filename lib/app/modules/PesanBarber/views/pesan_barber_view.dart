import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haircuts_barber_aja/app/data/addon/reuseable.dart';
import 'package:haircuts_barber_aja/app/data/model/services/service_model.dart';
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
              Text(
                controller.barberModel.value.namaToko,
                style: headerStyle().copyWith(fontSize: 30),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Pilih paket",
                style: headerStyle(),
              ),
              const SizedBox(
                height: 10,
              ),
              buildSelectService(),
              const SizedBox(
                height: 30,
              ),
              Text(
                "Pilih tanggal",
                style: headerStyle(),
              ),
              const SizedBox(
                height: 10,
              ),
              buildTanggalBooking(),
              buildJamBooking(),
              const SizedBox(
                height: 30,
              ),
              Text(
                "Pembayaran",
                style: headerStyle(),
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
    ServiceModel selectedModel = controller.selectedPaket.value;
    return GestureDetector(
      onTap: () {
        Get.bottomSheet(
          Container(
            height: 400,
            color: blackColor,
            padding: const EdgeInsets.all(8),
            child: buildDaftarPaket(
                daftarPaket: controller.barberModel.value.daftarPaket),
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  selectedModel.namaPaket,
                  style: const TextStyle(
                      color: blackColor, fontWeight: FontWeight.bold),
                ),
              ),
              Card(
                color: yellowColor.withOpacity(0.2),
                elevation: 0,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    moneyFormat(money: selectedModel.hargaPaket),
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
            initialDate: controller.selectedDate.value,
            context: Get.context!,
            firstDate: controller.selectedDate.value,
            lastDate: DateTime.now().add(const Duration(days: 30)),
          );
        },
        trailing: const Icon(
          Icons.edit,
          color: whiteColor,
        ),
        title: Text(
          DateFormat(DateFormat.YEAR_MONTH_DAY).format(
            controller.selectedDate.value,
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
          ...Payment.values.map(
            (e) => ListTile(
              contentPadding: const EdgeInsets.all(0),
              leading: Radio(
                value: e,
                groupValue: controller.selectedPayment.value,
                onChanged: (value) {
                  controller.selectedPayment.value = value!;
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
              controller.proceedPay();
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

  Widget buildDaftarPaket({required List<ServiceModel> daftarPaket}) {
    return ListView(
      children: daftarPaket
          .map(
            (e) => Card(
              elevation: 3,
              child: ListTile(
                leading: Radio(
                  value: e,
                  groupValue: controller.selectedPaket.value,
                  onChanged: (value) {
                    controller.selectedPaket.value = value!;
                  },
                ),
                title: Text(e.namaPaket),
                subtitle: Text(
                  moneyFormat(money: e.hargaPaket),
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
