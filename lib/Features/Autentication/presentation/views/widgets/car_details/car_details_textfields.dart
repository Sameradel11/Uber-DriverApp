import 'package:drivers_app/Features/Autentication/presentation/views/widgets/car_details/custom_drop_down_button.dart';
import 'package:drivers_app/core/custom_text_field.dart';
import 'package:drivers_app/core/style.dart';
import 'package:flutter/material.dart';

class CarDetailsTextFields extends StatefulWidget {
  const CarDetailsTextFields(
      {super.key,
      required this.carModelcontroller,
      required this.carNumbercontroller,
      required this.carColorcontroller,
      });
  final TextEditingController carModelcontroller;
  final TextEditingController carNumbercontroller;
  final TextEditingController carColorcontroller;

  @override
  State<CarDetailsTextFields> createState() => _CarDetailsTextFieldsState();
}

class _CarDetailsTextFieldsState extends State<CarDetailsTextFields> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        children: [
          CustomTextField(
              controller: widget.carModelcontroller,
              label: const Text(
                "Car Model",
                style: Style.textstyle16,
              )),
          const SizedBox(
            height: 15,
          ),
          CustomTextField(
              controller: widget.carNumbercontroller,
              label: const Text(
                "Car Number",
                style: Style.textstyle16,
              )),
          const SizedBox(
            height: 15,
          ),
          CustomTextField(
              controller: widget.carColorcontroller,
              label: const Text(
                "Car Color",
                style: Style.textstyle16,
              )),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
