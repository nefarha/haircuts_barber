import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haircuts_barber_aja/app/data/addon/reuseable.dart';
import 'package:haircuts_barber_aja/app/routes/app_pages.dart';

import '../controllers/account_info_controller.dart';

class AccountInfoView extends GetView<AccountInfoController> {
  const AccountInfoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => stackWithLoadingIndicator(
          isLoading: controller.isLoading.value,
          children: [
            Scaffold(
              appBar: reusableAppbar(title: 'Info Profil', enableBack: true),
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      buildProfileHeader(),
                      const Divider(),
                      const SizedBox(
                        height: 10,
                      ),
                      infoBalance(),
                      const SizedBox(
                        height: 10,
                      ),
                      infoPersonal(),
                      const SizedBox(
                        height: 10,
                      ),
                      infoAddress(),
                      const SizedBox(
                        height: 10,
                      ),
                      if (controller.user.accountType ==
                          ACCOUNT_TYPE.BARBER.name)
                        shopPage(),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }

  Widget buildProfileHeader() {
    return Obx(
      () => SizedBox(
        height: 200,
        width: Get.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            reusableAvatar(
              size: 65,
              url: controller.user.profileUrl,
              enableEdit: true,
              onTap: () async {
                Get.defaultDialog(content: popUpProfilEDit(), title: 'Edit');
              },
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              controller.user.name,
              style: headerStyle(),
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              controller.user.email,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ),
    );
  }

  Widget infoBalance() {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Saldo',
            style: headerStyle(),
          ),
          const SizedBox(
            height: 10,
          ),
          Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            elevation: 3,
            color: greyColor,
            child: Column(
              children: [
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                  title: const Text(
                    'saldo',
                    style: TextStyle(
                        color: whiteColor, fontWeight: FontWeight.bold),
                  ),
                  trailing: Text(
                    moneyFormat(money: controller.user.balance ?? 0),
                    style: const TextStyle(
                        color: whiteColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Get.toNamed(Routes.INFO_SALDO);
                  },
                  child: Container(
                    color: blackColor,
                    padding: const EdgeInsets.all(10),
                    child: const Row(
                      children: [
                        Text(
                          'buka halaman',
                          style: TextStyle(
                            color: whiteColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                        Icon(
                          Icons.arrow_right_alt,
                          color: whiteColor,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget infoPersonal() {
    return Obx(() => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Info Pribadi',
              style: headerStyle(),
            ),
            const SizedBox(
              height: 10,
            ),
            Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              elevation: 3,
              color: greyColor,
              child: Column(
                children: [
                  ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                    title: const Text(
                      'nama',
                      style: TextStyle(
                          color: whiteColor, fontWeight: FontWeight.bold),
                    ),
                    trailing: SizedBox(
                      width: 200,
                      child: Text(
                        controller.user.name,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            color: whiteColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ),
                  ),
                  ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                    title: const Text(
                      'phone',
                      style: TextStyle(
                          color: whiteColor, fontWeight: FontWeight.bold),
                    ),
                    trailing: SizedBox(
                      width: 200,
                      child: Text(
                        controller.user.phone!,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            color: whiteColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ),
                  ),
                  ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                    title: const Text(
                      'email',
                      style: TextStyle(
                          color: whiteColor, fontWeight: FontWeight.bold),
                    ),
                    trailing: SizedBox(
                      width: 200,
                      child: Text(
                        controller.user.email,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            color: whiteColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.EDIT_INFO);
                    },
                    child: Container(
                      color: blackColor,
                      padding: const EdgeInsets.all(10),
                      child: const Row(
                        children: [
                          Text(
                            'edit info',
                            style: TextStyle(
                              color: whiteColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Spacer(),
                          Icon(
                            Icons.arrow_right_alt,
                            color: whiteColor,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }

  Widget infoAddress() {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Info Alamat',
            style: headerStyle(),
          ),
          const SizedBox(
            height: 10,
          ),
          Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            elevation: 3,
            color: greyColor,
            child: Column(
              children: [
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                  title: const Text(
                    'alamat',
                    style: TextStyle(
                        color: whiteColor, fontWeight: FontWeight.bold),
                  ),
                  trailing: SizedBox(
                    width: 200,
                    child: Text(
                      controller.user.addressModel?.description ?? 'Alamat',
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          color: whiteColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  ),
                ),
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                  title: const Text(
                    'provinsi',
                    style: TextStyle(
                        color: whiteColor, fontWeight: FontWeight.bold),
                  ),
                  trailing: SizedBox(
                    width: 200,
                    child: Text(
                      controller.user.addressModel?.province.province ??
                          "provinsi",
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          color: whiteColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  ),
                ),
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                  title: const Text(
                    'kota',
                    style: TextStyle(
                        color: whiteColor, fontWeight: FontWeight.bold),
                  ),
                  trailing: SizedBox(
                    width: 200,
                    child: Text(
                      controller.user.addressModel?.city.city_name ?? "Kota",
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          color: whiteColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  ),
                ),
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                  title: const Text(
                    'deskripsi',
                    style: TextStyle(
                        color: whiteColor, fontWeight: FontWeight.bold),
                  ),
                  trailing: SizedBox(
                    width: 200,
                    child: Text(
                      controller.user.addressModel?.description ??
                          "Deskripsi alamat",
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          color: whiteColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.EDIT_ADDRESS, arguments: true);
                  },
                  child: Container(
                    color: blackColor,
                    padding: const EdgeInsets.all(10),
                    child: const Row(
                      children: [
                        Text(
                          'edit alamat',
                          style: TextStyle(
                            color: whiteColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                        Icon(
                          Icons.arrow_right_alt,
                          color: whiteColor,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget shopPage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Halaman Toko',
          style: headerStyle(),
        ),
        const SizedBox(
          height: 10,
        ),
        Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          elevation: 3,
          color: greyColor,
          child: Column(
            children: [
              const ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
                title: Text(
                  'toko',
                  style:
                      TextStyle(color: whiteColor, fontWeight: FontWeight.bold),
                ),
                trailing: SizedBox(
                  width: 200,
                  child: Text(
                    'lihat toko',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: whiteColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.TOKO_SAYA);
                },
                child: Container(
                  color: blackColor,
                  padding: const EdgeInsets.all(10),
                  child: const Row(
                    children: [
                      Text(
                        'edit toko',
                        style: TextStyle(
                          color: whiteColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      Icon(
                        Icons.arrow_right_alt,
                        color: whiteColor,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget popUpProfilEDit() {
    return SizedBox(
      width: 250,
      child: Column(
        children: [
          ListTile(
            onTap: () async {
              await controller.pickAndUploadProfile();
            },
            title: const Text('Ubah'),
            leading: const Icon(Icons.edit),
          ),
          ListTile(
            onTap: () async {
              if (controller.user.profileUrl != null) {
                await controller.deleteProfilePicture();
              }
            },
            title: const Text('Hapus'),
            leading: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
