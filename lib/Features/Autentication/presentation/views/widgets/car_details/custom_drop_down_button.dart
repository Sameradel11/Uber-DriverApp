import 'package:flutter/material.dart';
class CustomDropDownButton extends StatefulWidget {
  CustomDropDownButton({super.key, required this.selectedvalue});
  String? selectedvalue;

  @override
  State<CustomDropDownButton> createState() => _CustomDropDownButtonState();
}

class _CustomDropDownButtonState extends State<CustomDropDownButton> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please select a value";
        }
        return null;
      },
      icon: const Icon(Icons.arrow_downward),
      alignment: Alignment.center,
      value: widget.selectedvalue,
      hint: const Text("Please choose car type "),
      items: const [
        DropdownMenuItem(
          value: "Uber X",
          child: Text("Uber X"),
        ),
        DropdownMenuItem(
          value: "Uber Scotter",
          child: Text("Uber Scotter"),
        ),
        DropdownMenuItem(
          value: "Uber go",
          child: Text("Uber go"),
        ),
      ],
      onChanged: (dynamic value) {
        widget.selectedvalue = value.toString();
        setState(() {});
      },
    );
  }
}
