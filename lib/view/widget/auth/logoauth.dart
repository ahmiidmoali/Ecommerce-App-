import 'package:flutter/material.dart';

import '../../../core/constant/imageasset.dart';

class logoAuth extends StatelessWidget {
  const logoAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppImageAsset.newlogo,
      height: 120,
      width: 500,
    );
  }
}
