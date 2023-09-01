import 'package:drivers_app/core/app_routes.dart';
import 'package:drivers_app/core/style.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12))),
            backgroundColor: MaterialStateProperty.all(Colors.blue.shade800)),
        onPressed: () => GoRouter.of(context).push(AppRoutes.Kcardetails),
        child: Text(
          text,
          style: Style.textstyle18,
        ));
  }
}
