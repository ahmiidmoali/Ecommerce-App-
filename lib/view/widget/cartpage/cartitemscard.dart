import 'package:flutter/material.dart';
import 'package:project33/linkapi.dart';
import '../../../core/constant/appcolor.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CustomCartItemsCard extends StatelessWidget {
  final String itemsname;
  final String imagename;
  final String itemsPrice;
  final String howmany;
  final void Function()? removebutton;
  final void Function()? addbutton;
  const CustomCartItemsCard(
      {super.key,
      required this.itemsname,
      required this.itemsPrice,
      required this.howmany,
      required this.imagename,
      required this.removebutton,
      required this.addbutton});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: const EdgeInsets.only(left: 6),
        height: 115,
        child: Row(
          children: [
            Expanded(
                flex: 3,
                child: CachedNetworkImage(
                  imageUrl: "${AppLink.imageitems}/${imagename}",
                  height: 100,
                  width: 120,
                  fit: BoxFit.fill,
                )),
            Expanded(
                flex: 4,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        itemsname,
                        style: const TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                            height: 1),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          itemsPrice,
                          style: const TextStyle(
                              fontSize: 22,
                              color: AppColor.primaryColor,
                              fontWeight: FontWeight.bold,
                              height: 1),
                        ),
                      )
                    ],
                  ),
                )),
            Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Expanded(
                        child: IconButton(
                            onPressed: addbutton, icon: const Icon(Icons.add))),
                    Expanded(
                      flex: 2,
                      child: Container(
                        padding: const EdgeInsets.only(bottom: 15),
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          howmany,
                          style: const TextStyle(
                              fontSize: 22,
                              color: AppColor.primaryColor,
                              fontWeight: FontWeight.bold,
                              height: 1),
                        ),
                      ),
                    ),
                    Expanded(
                        child: IconButton(
                            onPressed: removebutton,
                            icon: const Icon(Icons.remove))),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
