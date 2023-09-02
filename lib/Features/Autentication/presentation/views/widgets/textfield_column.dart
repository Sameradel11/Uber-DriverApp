import 'package:flutter/material.dart';

import '../../../../../core/custom_text_field.dart';

class TextFieldsColumn extends StatelessWidget {
  const TextFieldsColumn({
    super.key,
    required this.namecontroller,
    required this.emailcontroller,
    required this.phonecontroller,
    required this.passwordcontroller,
  });
  final TextEditingController namecontroller;
  final TextEditingController emailcontroller;
  final TextEditingController phonecontroller;
  final TextEditingController passwordcontroller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        children: [
          CustomTextField(
            controller: namecontroller,
            type: TextInputType.name,
            label: const Text(
              "Name",
              style: TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          CustomTextField(
            controller: emailcontroller,
            type: TextInputType.emailAddress,
            label: const Text(
              "Email",
              style: TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          CustomTextField(
            controller: phonecontroller,
            type: TextInputType.phone,
            label: const Text(
              "Phone",
              style: TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          CustomTextField(
            controller: passwordcontroller,
            action: TextInputAction.send,
            hidetext: true,
            type: TextInputType.visiblePassword,
            label: const Text(
              "Password",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
