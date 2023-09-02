import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      this.controller,
      required this.label,
      this.prefix,
      this.onchange,
      this.onsaved,
      this.ontap,
      this.type = TextInputType.text,
      this.readonly = false,
      this.hidetext = false,
      this.action = TextInputAction.next});
  final hidetext;
  final onchange;
  final onsaved;
  final TextEditingController? controller;
  final Text label;
  final prefix;
  final ontap;
  final TextInputType type;
  final bool readonly;
  final TextInputAction action;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: action,
      obscureText: hidetext,
      readOnly: readonly,
      keyboardType: type,
      onTap: ontap,
      onChanged: onchange,
      onSaved: onsaved,
      controller: controller,
      style: const TextStyle(fontSize: 18),
      decoration: InputDecoration(
          label: label,
          prefix: prefix,
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(9),
              borderSide: BorderSide(color: Colors.red.shade800)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(9),
              borderSide: BorderSide(color: Colors.blue.shade800)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(9),
              borderSide: const BorderSide(color: Colors.white))),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '${label.data} is required';
        }
        return null;
      },
    );
  }
}
