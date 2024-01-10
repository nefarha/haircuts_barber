import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haircuts_barber_aja/app/controllers/firestore_controller.dart';
import 'package:intl/intl.dart';

const whiteColor = Color(0xfffafafa);
const blackColor = Color(0xff383838);
const yellowColor = Color.fromARGB(255, 236, 165, 50);
var greyColor = Colors.grey.shade700;

enum STATUS_BOOKING {
  Upcoming,
  Working,
  Completed,
  Cancelled,
}

enum STATUS_PAYMENT {
  SUCCESSFUL,
  CANCELED,
  FAILED,
  EXPIRED,
  ACTIVE,
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
    {required String title, bool enableBack = false, List<Widget>? actions}) {
  return AppBar(
    leading: (enableBack)
        ? const BackButton(
            color: blackColor,
          )
        : null,
    title: Text(
      title,
    ),
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

Widget reusableShopCard(
    {required String title, required String location, void Function()? onTap}) {
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
                color: blackColor,
              ),
              Padding(
                padding: const EdgeInsets.all(4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: blackColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      location,
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
      isLoading
          ? Center(
              child: Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                child: Container(
                  width: 80,
                  height: 80,
                  padding: const EdgeInsets.all(10),
                  child: const CircularProgressIndicator(
                    color: blackColor,
                  ),
                ),
              ),
            )
          : const SizedBox(),
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
  return DateFormat('yyyy-MM-dd HH:mm', "id").format(date);
}

String moneyFormat({required num money}) {
  return NumberFormat.simpleCurrency(locale: "id", decimalDigits: 0)
      .format(money);
}

Widget testimonialCard({required int index}) {
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
        title: const Text('Nama User'),
        subtitle: Row(
          children: [
            Icon(
              Icons.star,
              color: greyColor,
            ),
            const Text('4.5')
          ],
        ),
      ),
      Text('Lorem Ipsum is great by the way ' * (index + 1)),
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
  required String id,
  required FirestoreController dataC,
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
          // dataC.updatePhone(id: id, phone: phoneNumber);
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
    backgroundColor: url == null ? yellowColor : greyColor,
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
