import 'package:flutter/material.dart';
import 'package:project33/core/class/statusrequest.dart';
import 'package:lottie/lottie.dart';
import 'package:project33/core/constant/imageasset.dart';

class handlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const handlingDataView(
      {super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(
            child: Lottie.asset(AppImageAsset.loading, height: 250, width: 250),
          )
        : statusRequest == StatusRequest.offlinefailure
            ? Center(
                child: Lottie.asset(AppImageAsset.offline,
                    height: 250, width: 250),
              )
            : statusRequest == StatusRequest.serverfailure
                ? Center(
                    child: Lottie.asset(AppImageAsset.server,
                        height: 250, width: 250))
                : statusRequest == StatusRequest.failure
                    ? Center(
                        child: Lottie.asset(AppImageAsset.noData,
                            height: 250, width: 250),
                      )
                    : widget;
  }
}

class handlingRequestView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const handlingRequestView(
      {super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(
            child: Lottie.asset(AppImageAsset.loading, height: 250, width: 250),
          )
        : statusRequest == StatusRequest.offlinefailure
            ? Center(
                child: Lottie.asset(AppImageAsset.offline,
                    height: 250, width: 250),
              )
            : statusRequest == StatusRequest.serverfailure
                ? Center(
                    child: Lottie.asset(AppImageAsset.server,
                        height: 250, width: 250))
                : widget;
  }
}
