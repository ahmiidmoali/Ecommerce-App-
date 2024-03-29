import 'package:flutter/material.dart';
import 'package:project33/controller/profilepage_controller.dart';
import 'package:project33/core/constant/appcolor.dart';
import 'package:get/get.dart';
import 'package:project33/core/constant/routes.dart';
import 'package:project33/view/widget/profile/customlisttile.dart';
import 'package:url_launcher/url_launcher.dart';

class profilePage extends StatelessWidget {
  const profilePage({super.key});

  @override
  Widget build(BuildContext context) {
    ProfilePageController controller = Get.put(ProfilePageController());
    return Container(
      color: AppColor.background,
      child: ListView(
        children: [
          Container(
            child: Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: Get.width / 2,
                  color: AppColor.primaryColor,
                ),
                Positioned(
                    top: (Get.width / 2) - 60,
                    child: Container(
                        height: 120,
                        width: 120,
                        alignment: Alignment.bottomCenter,
                        child: Image.asset("assets/images/profile.png")))
              ],
            ),
          ),
          const SizedBox(height: 60),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColor.white,
                  ),
                  child: ListTile(
                      leading: Text(
                        "s1".tr, // "Notification"
                        style: const TextStyle(fontSize: 20),
                      ),
                      trailing: GetBuilder<ProfilePageController>(
                        builder: (controller) => Switch(
                          value: controller.isswitch,
                          onChanged: (value) {
                            controller.updateswitch(value);
                          },
                        ),
                      )),
                ),
                // CustomProfileListTile(
                //     title: "Archive",
                //     onpress: () {},
                //     icon: Icons.article_sharp),
                CustomProfileListTile(
                    title: "s2".tr, //"language"
                    onpress: () {
                      Get.toNamed(AppRoute.language);
                    },
                    icon: Icons.language_outlined),
                CustomProfileListTile(
                    title: "s3".tr, //"Orders"
                    onpress: () {
                      Get.toNamed(AppRoute.pending);
                    },
                    icon: Icons.article_sharp),
                CustomProfileListTile(
                    title: "s4".tr, //"Adress"
                    onpress: () {
                      Get.toNamed(AppRoute.addressview);
                    },
                    icon: Icons.house_outlined),
                CustomProfileListTile(
                    title: "s5".tr, //"About Us"
                    onpress: () {},
                    icon: Icons.help_outline_outlined),
                CustomProfileListTile(
                    title: "s6".tr, //"Contact Us"
                    onpress: () {
                      launchUrl(Uri.parse("tel:+1-555-010-999"));
                    },
                    icon: Icons.phone),
                CustomProfileListTile(
                    title: "s7".tr, // "Log Out"
                    onpress: () {
                      controller.logOut();
                    },
                    icon: Icons.logout_outlined),
              ],
            ),
          )
        ],
      ),
    );
  }
}
