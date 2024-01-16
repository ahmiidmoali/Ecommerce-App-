import 'package:flutter/material.dart';

class customTextTitleAuth extends StatelessWidget {
  final String text;
  const customTextTitleAuth({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.displayLarge,
      textAlign: TextAlign.center,
    );
  }
}
