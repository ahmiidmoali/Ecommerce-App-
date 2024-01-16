import 'package:flutter/material.dart';
import 'package:project33/controller/address/address_view_controller.dart';
import 'package:project33/core/class/handlingdataview.dart';
import 'package:project33/core/constant/appcolor.dart';
import 'package:get/get.dart';
import 'package:project33/core/constant/routes.dart';
import 'package:project33/view/widget/address/addressmodalbottomsheet.dart';
import 'package:project33/view/widget/address/editmodalbottomsheet.dart';

class addressview extends StatelessWidget {
  const addressview({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddressViewController());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.primaryColor,
          title: const Text('Address Page'),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColor.primaryColor,
          onPressed: () {
            Get.offNamed(AppRoute.addressadd);
          },
          child: const Icon(Icons.add),
        ),
        body: GetBuilder<AddressViewController>(
          builder: (controller) => handlingDataView(
              statusRequest: controller.statusRequest,
              widget: ListView.builder(
                itemCount: controller.listdata.length,
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) => AddressModalBottomSheet(
                            addressModel: controller.listdata[index]));
                  },
                  child: Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Card(
                      child: ListTile(
                          title:
                              Text("${controller.listdata[index].addressCity}"),
                          trailing: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                      onPressed: () async {
                                        initialcontroller() {
                                          controller.addressnamecont =
                                              TextEditingController(
                                                  text:
                                                      "${controller.listdata[index].addressName}");
                                          controller.addresscitycont =
                                              TextEditingController(
                                                  text:
                                                      "${controller.listdata[index].addressCity}");
                                          controller.addressstreetcont =
                                              TextEditingController(
                                                  text:
                                                      "${controller.listdata[index].addressStreet}");
                                          controller.addressdetailscont =
                                              TextEditingController(
                                                  text:
                                                      "${controller.listdata[index].addressDetails}");
                                          controller.addressmobilecont =
                                              TextEditingController(
                                                  text:
                                                      "${controller.listdata[index].addressPhone}");
                                        }

                                        initialcontroller();
                                        showModalBottomSheet(
                                            context: context,
                                            builder: (context) =>
                                                EditModalBottomSheet(
                                                    onPressed: () {
                                                      controller.editAddress(
                                                          controller
                                                              .listdata[index]
                                                              .addressId
                                                              .toString());
                                                    },
                                                    addressModel: controller
                                                        .listdata[index]));
                                      },
                                      icon: const Icon(Icons.edit)),
                                  IconButton(
                                      onPressed: () {
                                        controller.deleteAddress(
                                            controller.listdata[index].addressId
                                                .toString(),
                                            controller
                                                .listdata[index].addressId!);
                                      },
                                      icon: const Icon(Icons.delete))
                                ],
                              ),
                            ],
                          ),
                          subtitle: Text(
                              "${controller.listdata[index].addressStreet}"),
                          leading: Text(
                              "${controller.listdata[index].addressName}")),
                    ),
                  ),
                ),
              )),
        ));
  }
}
