import 'package:flutter/material.dart';

class customTextBodyAuth extends StatelessWidget {
  final String title;
  const customTextBodyAuth({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.displaySmall!.copyWith(fontSize: 15),
      textAlign: TextAlign.center,
    );
  }
}
