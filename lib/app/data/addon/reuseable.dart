import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haircuts_barber_aja/app/data/model/barber/barberModel.dart';
import 'package:haircuts_barber_aja/app/data/model/booking/booking_model.dart';
import 'package:haircuts_barber_aja/app/data/model/payment/payment_model.dart';
import 'package:haircuts_barber_aja/app/data/model/testimonial/testimonial.dart';
import 'package:haircuts_barber_aja/app/data/model/user/repository/user_repo.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:url_launcher/url_launcher.dart';

const whiteColor = Color(0xfffafafa);
const blackColor = Color(0xff383838);
const yellowColor = Color.fromARGB(255, 236, 165, 50);
var greyColor = Colors.grey.shade700;
const greenColor = Color.fromARGB(255, 64, 134, 66);

enum STATUS_BOOKING {
  UPCOMING,
  WORKING,
  COMPLETED,
  CANCELLED,
}

enum STATUS_PAYMENT {
  ACTIVE,
  SUCCESSFUL,
  FAILED,
  EXPIRED,
  CANCELED,
}

Color statusPembayaranColor(String stats) {
  var status =
      STATUS_PAYMENT.values.firstWhere((element) => element.name == stats);
  switch (status) {
    case STATUS_PAYMENT.ACTIVE:
      return const Color.fromARGB(255, 48, 143, 221);
    case STATUS_PAYMENT.CANCELED:
      return const Color.fromARGB(255, 202, 87, 78);
    case STATUS_PAYMENT.EXPIRED:
      return const Color.fromARGB(255, 233, 151, 29);
    case STATUS_PAYMENT.FAILED:
      return Colors.red;
    case STATUS_PAYMENT.SUCCESSFUL:
      return const Color.fromARGB(255, 72, 153, 74);
  }
}

enum ACCOUNT_TYPE {
  BARBER,
  USER,
}

enum BARBER_TYPE {
  BARBERSHOP,
  FREELANCER,
}

AppBar reusableAppbar(
    {required String title,
    bool enableBack = false,
    List<Widget>? actions,
    PreferredSizeWidget? bottom}) {
  return AppBar(
    leading: (enableBack)
        ? const BackButton(
            color: blackColor,
          )
        : null,
    title: Text(
      title,
    ),
    bottom: bottom,
    actions: actions,
    elevation: 0,
    centerTitle: true,
    backgroundColor: whiteColor,
    titleTextStyle: const TextStyle(
        color: blackColor, fontSize: 25, fontWeight: FontWeight.bold),
  );
}

TextStyle headerStyle() {
  return const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 20,
  );
}

Widget reusableContentCard({required String title, required String creator}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Card(
      elevation: 3,
      child: SizedBox(
        height: Get.height,
        width: 230,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              Text(
                creator,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: yellowColor,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ),
    ),
  );
}

Widget reusableShopCard({required BarberModel model, void Function()? onTap}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 3,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: SizedBox(
          height: Get.height,
          width: 230,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 130,
                decoration: BoxDecoration(
                    color: blackColor,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: CachedNetworkImageProvider(
                            model.daftarGambar.firstOrNull))),
              ),
              Padding(
                padding: const EdgeInsets.all(4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model.namaToko,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: blackColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      model.alamat.alamat,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: blackColor,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Row(
                      children: [
                        Icon(
                          Icons.star,
                          size: 15,
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Text('3.0')
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget reusableShimmerShopCard() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Card(
      elevation: 3,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: SizedBox(
        height: Get.height,
        width: 230,
        child: const Center(
          child: CircularProgressIndicator(
            color: yellowColor,
          ),
        ),
      ),
    ),
  );
}

Widget reusableEmptyShopCard() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Card(
      elevation: 3,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: SizedBox(
        height: Get.height,
        width: 230,
        child: const Center(
            child: Text(
          "Belum Ada Toko",
        )),
      ),
    ),
  );
}

Widget buildPinPoint({void Function()? onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Card(
      elevation: 3,
      color: blackColor,
      child: Container(
        padding: const EdgeInsets.all(8),
        width: Get.width,
        height: 70,
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.map,
              color: whiteColor,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'PinPoint lokasimu',
              style: TextStyle(color: whiteColor),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget buildFormAddress(
    {required String hint,
    required TextEditingController textEditingController,
    required List<DropdownMenuItem> items,
    required void Function(dynamic)? onChanged,
    dynamic value}) {
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    color: Colors.grey.shade100,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: DropdownButtonHideUnderline(
        child: DropdownButtonFormField(
          validator: (value) => value == null ? 'mohon isi' : null,
          decoration: const InputDecoration(border: InputBorder.none),
          value: value,
          hint: Text(
            hint,
            style: const TextStyle(color: blackColor),
          ),
          style:
              const TextStyle(color: blackColor, fontWeight: FontWeight.bold),
          items: items,
          onChanged: onChanged,
        ),
      ),
    ),
  );
}

Widget stackWithLoadingIndicator(
    {required List<Widget> children, required bool isLoading}) {
  return Stack(
    children: [
      ...children,
      if (isLoading)
        Stack(
          children: [
            const Opacity(
              opacity: 0.7,
              child: ModalBarrier(
                dismissible: false,
                color: Colors.black,
              ),
            ),
            Center(
              child: Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                child: Container(
                  width: 80,
                  height: 80,
                  padding: const EdgeInsets.all(10),
                  child: loadingIndicator(),
                ),
              ),
            ),
          ],
        ),
    ],
  );
}

Widget reuseTextfield(
    {required String hintText,
    String? Function(String?)? validator,
    TextEditingController? controlller,
    TextInputType? inputType,
    int textHeight = 1,
    bool isObscured = false,
    bool enableIcon = false,
    FocusNode? focusNode,
    bool enabled = true}) {
  var obscured = RxBool(isObscured);
  var enable = enabled.obs;
  return Obx(
    () => Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: Colors.grey.shade100,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          enabled: enable.value,
          keyboardType: inputType,
          controller: controlller,
          validator: validator,
          obscureText: obscured.value,
          maxLines: textHeight,
          focusNode: focusNode,
          style:
              const TextStyle(color: blackColor, fontWeight: FontWeight.bold),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: const TextStyle(color: blackColor),
            suffixIcon: (enableIcon)
                ? IconButton(
                    onPressed: () {
                      obscured.toggle();
                    },
                    icon: Icon((obscured.value)
                        ? Icons.visibility_off
                        : Icons.visibility),
                  )
                : null,
          ),
        ),
      ),
    ),
  );
}

Widget reuseCardStatus(
    {required String status,
    required String groupStatus,
    required String text,
    void Function()? onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: 40,
      width: Get.width * 0.25,
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        border: (status == groupStatus)
            ? const Border(
                bottom: BorderSide(color: yellowColor, width: 4),
              )
            : null,
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
              color: (status == groupStatus) ? yellowColor : Colors.grey,
              fontSize: 13),
        ),
      ),
    ),
  );
}

String reuseDateFormat({required DateTime date}) {
  return DateFormat('yyyy MMMM dd - HH:mm', "id").format(date);
}

String moneyFormat({required num money}) {
  return NumberFormat.simpleCurrency(locale: "id", decimalDigits: 0)
      .format(money);
}

Widget testimonialCard({required TestiMonialModel model}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      ListTile(
        contentPadding: const EdgeInsets.all(0),
        leading: const CircleAvatar(
          backgroundColor: blackColor,
          child: Icon(
            Icons.person,
            color: yellowColor,
          ),
        ),
        title: Text(model.ownerName),
        subtitle: Row(
          children: [
            Icon(
              Icons.star,
              color: greyColor,
            ),
            Text(model.rating.toDouble().toString())
          ],
        ),
      ),
      Text(model.text),
      const SizedBox(
        height: 5,
      ),
      const Divider(
        color: blackColor,
      ),
    ],
  );
}

Widget reusableEditField(
    {required String label,
    required TextEditingController controller,
    TextInputType? inputType,
    int maxLine = 1}) {
  return TextFormField(
    controller: controller,
    keyboardType: inputType,
    maxLines: maxLine,
    style: const TextStyle(color: whiteColor),
    decoration: InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(color: whiteColor),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: yellowColor, width: 3),
      ),
    ),
    validator: (value) => value!.isEmpty ? 'Mohon isi' : null,
  );
}

Future<String?> askingSMSCode({
  required String verificationId,
  required FirebaseAuth instance,
  required String userId,
  required UserRepo dataC,
  required String phoneNumber,
  void Function()? onConfirm,
}) async {
  TextEditingController smscontroller = TextEditingController();
  return await Get.defaultDialog(
    barrierDismissible: false,
    onCancel: () {},
    title: "OTP",
    content: reuseTextfield(
      controlller: smscontroller,
      hintText: 'masukkan kode',
      inputType: TextInputType.number,
    ),
    onConfirm: () async {
      if (smscontroller.text.isNotEmpty) {
        PhoneAuthCredential credential = PhoneAuthProvider.credential(
            verificationId: verificationId, smsCode: smscontroller.text);

        try {
          await instance.currentUser!.updatePhoneNumber(credential);
          dataC.updatePhone(id: userId, phoneNumber: phoneNumber);
          instance.userChanges();
          onConfirm ?? Get.back();
        } on FirebaseAuthException catch (e) {
          buildErrorDialog(
              message:
                  "Terjadi Kesalahan dengan code ${e.code}, '${e.message}'");
        }
      }
    },
  );
}

Widget reusableAvatar(
    {double? size,
    String? url,
    bool enableEdit = false,
    void Function()? onTap}) {
  return CircleAvatar(
    radius: size,
    backgroundColor: url == null ? blackColor : greyColor,
    backgroundImage: url != null ? CachedNetworkImageProvider(url) : null,
    child: url == null
        ? Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Icon(
                  Icons.person,
                  size: size,
                  color: whiteColor,
                ),
              ),
              if (enableEdit)
                Align(
                  alignment: Alignment.bottomRight,
                  child: GestureDetector(
                    onTap: onTap,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: blackColor,
                        border: Border.all(color: whiteColor, width: 3),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.edit,
                          color: whiteColor,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          )
        : Stack(
            children: [
              if (enableEdit)
                Align(
                  alignment: Alignment.bottomRight,
                  child: GestureDetector(
                    onTap: onTap,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: blackColor,
                        border: Border.all(color: whiteColor, width: 3),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.edit,
                          color: whiteColor,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
  );
}

Widget reusableElevatedButton(
    {required void Function()? onPressed,
    required String title,
    double? size}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        fixedSize: Size(
          size ?? Get.width,
          50,
        ),
        backgroundColor: blackColor),
    onPressed: onPressed,
    child: Text(
      title,
      style: const TextStyle(
        color: whiteColor,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

Widget reusableHistoryPembayaranCard(
    {required PaymentModel model, void Function()? onTap}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    child: GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        reuseDateFormat(
                          date: model.createdAt,
                        ),
                      ),
                      Text(
                        model.status,
                        style: TextStyle(
                            color: statusPembayaranColor(model.status)),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.store,
                      color: blackColor,
                    ),
                    contentPadding: const EdgeInsets.all(0),
                    title: Text(
                      model.paymentType == "BOOKING"
                          ? model.bookingModel!.barberStore.namaToko
                          : "TOP UP",
                    ),
                    subtitle: Text(model.paymentType == "BOOKING"
                        ? 'nama barber'
                        : "Jenis Transaksi"),
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.money,
                      color: Colors.green,
                    ),
                    contentPadding: const EdgeInsets.all(0),
                    title: Text(
                      moneyFormat(money: model.amount),
                    ),
                    subtitle: const Text('total biaya'),
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.timelapse,
                      color: Colors.red,
                    ),
                    contentPadding: const EdgeInsets.all(0),
                    title: Text(
                      model.expired_date,
                    ),
                    subtitle: const Text('bayar sebelum'),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                if (model.status == STATUS_PAYMENT.ACTIVE.name) {
                  launchUrl(Uri.parse("https://${model.link_url}"));
                }
              },
              child: Container(
                color: blackColor,
                child: const ListTile(
                  title: Text(
                    'Bayar Sekarang',
                    style: TextStyle(
                        color: whiteColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  trailing: Icon(
                    Icons.arrow_right,
                    color: whiteColor,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ),
  );
}

Widget filterCard(
    {required String status,
    void Function()? onTap,
    Color? color,
    Color? textColor}) {
  return GestureDetector(
    onTap: onTap,
    child: Card(
      color: color,
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          status,
          style: TextStyle(color: textColor),
        ),
      ),
    ),
  );
}

Widget reuseBookingCard(
    {required BookingModel model, required void Function(bool)? onChanged}) {
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          width: 0.3,
          color: greyColor,
        )),
    child: Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                reuseDateFormat(date: model.tanggal),
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: blackColor),
              ),
              const Spacer(),
              Icon(
                Icons.notifications,
                color: model.isReminder ?? false ? yellowColor : blackColor,
              ),
              Switch(
                activeColor: whiteColor,
                activeTrackColor: yellowColor,
                value: model.isReminder ?? false,
                onChanged: onChanged,
              ),
            ],
          ),
          const Divider(
            thickness: 0.5,
            color: blackColor,
          ),
          ListTile(
            contentPadding: const EdgeInsets.all(0),
            title: Text(
              model.barberStore.namaToko,
              style: headerStyle().copyWith(fontSize: 17),
            ),
            subtitle: Row(
              children: [
                const Icon(
                  Icons.location_on,
                  color: yellowColor,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(model.barberStore.alamat.alamat)
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

buildErrorDialog({required String message}) {
  Get.defaultDialog(
    title: 'Peringatan',
    middleText: 'Error occured with $message',
    confirmTextColor: whiteColor,
    confirm: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: blackColor),
        onPressed: () => Get.until((route) => !Get.isDialogOpen!),
        child: const Text('mengerti')),
  );
}

buildAttention(e, {void Function()? onConfirm}) {
  Get.defaultDialog(
    title: 'Attention',
    middleText: e,
    textConfirm: 'got it',
    confirm: ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: blackColor),
      onPressed: () => Get.back(),
      child: const Text('mengerti'),
    ),
  );
}

buildLoading() {
  Get.defaultDialog(
    backgroundColor: whiteColor,
    title: 'Loading',
    content: const Center(
      child: CircularProgressIndicator(
        color: blackColor,
      ),
    ),
    barrierDismissible: false,
  );
}

closeDialog() {
  Get.until((route) => !Get.isDialogOpen!);
}

updateLoading({
  required RxBool currentValue,
  required bool newValue,
}) {
  currentValue.value = newValue;
}

Widget loadingIndicator() {
  return Center(
    child: LoadingAnimationWidget.flickr(
        leftDotColor: yellowColor, rightDotColor: blackColor, size: 50),
  );
}
