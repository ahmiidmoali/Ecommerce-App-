import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project33/core/class/handlingdataview.dart';
import 'package:project33/core/constant/appcolor.dart';
import 'package:project33/data/model/itemscardmodel.dart';

import '../../../controller/orders/details_controller.dart';
import '../../widget/addressdetails/adressdetailscard.dart';

class orderDetails extends StatefulWidget {
  const orderDetails({super.key});

  @override
  State<orderDetails> createState() => _orderDetailsState();
}

class _orderDetailsState extends State<orderDetails> {
  @override
  Widget build(BuildContext context) {
    OrderDetailsController controller = Get.put(OrderDetailsController());
    // ItemsCardModel itemsCardModel=ItemsCardModel.fromJson(controller.dataorders);
    return Scaffold(
        body: GetBuilder<OrderDetailsController>(
      builder: (controller) => handlingDataView(
        statusRequest: controller.statusRequest,
        widget: Container(
          margin: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          child: ListView(
            children: [
              Card(
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Table(children: const [
                      TableRow(children: [
                        TitleTextDetails(text: "Items"),
                        TitleTextDetails(text: "Quantity"),
                        TitleTextDetails(text: "Price")
                      ]),
                    ]),
                    ...List.generate(
                        controller.dataitems.length,
                        (index) => ItemsDetails(
                              itemsCardModel: controller.dataitems[index],
                            )),
                    Column(
                      children: [
                        Divider(height: 5, thickness: 4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TitleTextDetails(text: "Total Price : "),
                            TitleTextDetails(
                                text:
                                    "${controller.dataorders["orders_totalprice"]}")
                          ],
                        ),
                        ...List.generate(
                            controller.dataaddress.length,
                            (index) => controller
                                        .dataaddress[index].addressId ==
                                    controller.addressid
                                ? AddressModalcard(
                                    addressModel: controller.dataaddress[index],
                                  )
                                : Container(
                                    height: 1,
                                  )),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}

class TitleTextDetails extends StatelessWidget {
  final String text;
  const TitleTextDetails({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: Text(
          text,
          style: TextStyle(
              fontSize: 20,
              color: AppColor.primaryColor,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class BodyTextDetails extends StatelessWidget {
  final String text;
  const BodyTextDetails({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Text(
          text,
          style: TextStyle(fontSize: 18, color: AppColor.black),
        ),
      ),
    );
  }
}

class ItemsDetails extends StatelessWidget {
  final ItemsCardModel itemsCardModel;
  const ItemsDetails({super.key, required this.itemsCardModel});

  @override
  Widget build(BuildContext context) {
    return Table(children: [
      TableRow(children: [
        BodyTextDetails(text: "${itemsCardModel.itemsName}"),
        BodyTextDetails(text: "${itemsCardModel.totalcount}"),
        BodyTextDetails(text: "${itemsCardModel.totalprice}")
      ]),
    ]);
  }
}
