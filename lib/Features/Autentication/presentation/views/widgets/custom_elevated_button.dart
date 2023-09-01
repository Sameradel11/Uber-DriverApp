import 'package:drivers_app/core/style.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton(
      {super.key, required this.text, required this.ontap});
  final String text;
  final ontap;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12))),
            backgroundColor: MaterialStateProperty.all(Colors.blue.shade800)),
        onPressed: ontap,
        child: Text(
          text,
          style: Style.textstyle18,
        ));
  }
}
