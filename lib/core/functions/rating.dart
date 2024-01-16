import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project33/controller/orders/archive_controller.dart';
import 'package:project33/controller/orders/pending_controller.dart';
import 'package:project33/core/constant/imageasset.dart';
import 'package:project33/core/constant/routes.dart';
import 'package:rating_dialog/rating_dialog.dart';

void showratingdialog(BuildContext context, String id) {
  showDialog(
      context: context,
      barrierDismissible: true, // set to false if you want to force a rating
      builder: (context) => RatingDialog(
            initialRating: 1.0,
            // your app's name?
            title: Text(
              'Rate your order',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            // encourage your user to leave a high rating?
            message: Text(
              'please let us know if you have any problems and you will help you',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 15),
            ),
            // your app's logo?
            image: Image.asset(
              AppImageAsset.logo,
              height: 50,
            ),
            submitButtonText: 'Submit',
            commentHint: 'leave your comment here',
            onCancelled: () => print('cancelled'),
            onSubmitted: (response) async {
              print('rating: ${response.rating}, comment: ${response.comment}');
              PendingController controller = Get.find();
              ArchiveController controllerarch = Get.find();
              await controller.rateOrder(
                  id, "${response.rating}", "${response.comment}");
              controller.onInit();
              Get.back();

              // TODO: add your own logic
              if (response.rating < 3.0) {
                // send their comments to your email or anywhere you wish
                // ask the user to contact you instead of leaving a bad review
              } else {
                // _rateAndReviewApp();
              }
            },
          ));
}
