import 'package:flutter/material.dart';

import '../../../../../core/custom_text_field.dart';

class TextFieldsColumn extends StatelessWidget {
  const TextFieldsColumn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        children: [
          CustomTextField(
            type: TextInputType.name,
            label: Text(
              "Name",
              style: TextStyle(color: Colors.white),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          CustomTextField(
            type: TextInputType.emailAddress,
            label: Text(
              "Email",
              style: TextStyle(color: Colors.white),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          CustomTextField(
            type: TextInputType.phone,
            label: Text(
              "Phone",
              style: TextStyle(color: Colors.white),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          CustomTextField(
            action: TextInputAction.send,
            hidetext: true,
            type: TextInputType.visiblePassword,
            label: Text(
              "Password",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
