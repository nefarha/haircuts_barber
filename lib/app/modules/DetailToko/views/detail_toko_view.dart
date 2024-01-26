import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haircuts_barber_aja/app/data/addon/reuseable.dart';
import 'package:haircuts_barber_aja/app/data/model/barber/barberModel.dart';
import 'package:haircuts_barber_aja/app/data/model/testimonial/testimonial.dart';
import 'package:haircuts_barber_aja/app/data/model/user/userModel.dart';
import 'package:haircuts_barber_aja/app/routes/app_pages.dart';

import '../controllers/detail_toko_controller.dart';

class DetailTokoView extends GetView<DetailTokoController> {
  const DetailTokoView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) => Scaffold(
        appBar: reusableAppbar(title: '', enableBack: true),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              shopImage(model: state!.item1!),
              shopTitle(model: state.item1!, ownerModel: state.item2!),
              shopDescription(model: state.item1!),
              shopBundle(model: state.item1!),
              shopTestimonial(testimonialList: state.item3!),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
        bottomNavigationBar: placeOrderBottom(),
      ),
      onLoading: loadingIndicator(),
      onError: (error) => Center(
        child: Text(
          error.toString(),
          style: headerStyle(),
        ),
      ),
    );
  }

  Widget shopImage({required BarberModel model}) {
    return SizedBox(
      height: 250,
      width: Get.width,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const PageScrollPhysics(),
        child: Row(
          children: model.daftarGambar
              .map(
                (e) => Container(
                  height: Get.height,
                  width: Get.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: CachedNetworkImageProvider(e),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  Widget shopTitle(
      {required BarberModel model, required UserModel ownerModel}) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SizedBox(
        width: Get.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              model.namaToko,
              overflow: TextOverflow.ellipsis,
              style: headerStyle(),
            ),
            Text(
              model.alamat.alamat,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: TextStyle(color: greyColor),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Icon(
                  Icons.map,
                  color: greyColor,
                ),
                const SizedBox(
                  width: 15,
                ),
                Icon(
                  Icons.star,
                  color: greyColor,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  model.rating.toString(),
                  style: TextStyle(color: greyColor),
                ),
                const Spacer(),
                GestureDetector(
                    onTap: () {
                      print('message');
                    },
                    child: Icon(
                      Icons.chat_bubble,
                      color: greyColor,
                    )),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Divider(
              color: greyColor,
            ),
            ListTile(
              contentPadding: const EdgeInsets.all(0),
              leading: reusableAvatar(url: ownerModel.profileUrl),
              title: Text(ownerModel.name),
              subtitle: Text(model.shopType!),
            ),
          ],
        ),
      ),
    );
  }

  Widget shopDescription({required BarberModel model}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Tentang Toko',
            style: headerStyle(),
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            model.deskripsiToko,
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }

  Widget shopBundle({required BarberModel model}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: SizedBox(
          height: 50,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(model.daftarPaket.first.namaPaket),
                const Spacer(),
                Text(
                    '${moneyFormat(money: model.daftarPaket.first.hargaPaket)}/servis')
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget shopTestimonial({required List<TestiMonialModel> testimonialList}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Testimonials',
            style: headerStyle(),
          ),
          if (testimonialList.isNotEmpty)
            ...testimonialList.map((e) => testimonialCard(model: e)).toList()
          else
            const Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text("Belum ada testimoni"),
                ),
              ],
            ),
        ],
      ),
    );
  }

  Widget placeOrderBottom() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: GestureDetector(
        onTap: () {
          Get.toNamed(Routes.PESAN_BARBER,
              arguments: controller.barberModel.value);
        },
        child: Container(
          height: 40,
          width: Get.width,
          decoration: BoxDecoration(
            color: blackColor,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Center(
            child: Text(
              'Pesan sekarang',
              style: headerStyle().copyWith(color: whiteColor),
            ),
          ),
        ),
      ),
    );
  }
}
