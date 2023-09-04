import 'package:drivers_app/core/style.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class CustomProgressDialog extends StatelessWidget {
  const CustomProgressDialog({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.grey.shade600,
      child: Container(
        height: 70,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: Row(mainAxisSize: MainAxisSize.max, children: [
          const SizedBox(
            width: 20,
          ),
          const CircularProgressIndicator(),
          const Spacer(
            flex: 1,
          ),
          Text(
            text,
            style: Style.textstyle16.copyWith(color: Colors.white),
          ),
          const Spacer(
            flex: 2,
          ),
        ]),
      ),
    );
  }
}
