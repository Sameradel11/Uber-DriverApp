import 'package:drivers_app/core/style.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class ProgressDialog extends StatelessWidget {
  const ProgressDialog({super.key});

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
            "Creating account",
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
