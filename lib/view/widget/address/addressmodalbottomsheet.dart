import 'package:flutter/material.dart';

import '../../../core/constant/appcolor.dart';
import '../../../data/model/addressmodel.dart';

class AddressModalBottomSheet extends StatelessWidget {
  final AddressModel addressModel;
  const AddressModalBottomSheet({super.key, required this.addressModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.primaryColor,
      height: 230,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            child: Card(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "City :",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: AppColor.primaryColor),
                  ),
                  Text(
                    " ${addressModel.addressCity}",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            child: Card(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Street :",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: AppColor.primaryColor),
                  ),
                  Text(
                    " ${addressModel.addressStreet}",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Text(
                        "Details :",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: AppColor.primaryColor),
                      ),
                      Expanded(child: SizedBox())
                    ],
                  ),
                  Text(
                    " ${addressModel.addressDetails}",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            child: Card(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Phone :",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: AppColor.primaryColor),
                  ),
                  Text(
                    " ${addressModel.addressPhone}",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
