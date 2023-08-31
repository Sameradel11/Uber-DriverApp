import 'package:drivers_app/Features/splash/presentation/views/const.dart';
import 'package:drivers_app/core/app_routes.dart';
import 'package:drivers_app/core/custom_text_field.dart';
import 'package:drivers_app/core/style.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CarDetailsBody extends StatefulWidget {
  const CarDetailsBody({super.key});

  @override
  State<CarDetailsBody> createState() => _CarDetailsBodyState();
}

class _CarDetailsBodyState extends State<CarDetailsBody> {
  String? selectedvalue;
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            children: [
              Image.asset(KlogoPath),
              const Text(
                "Car Details",
                style: Style.textstyle20,
              ),
              const SizedBox(
                height: 20,
              ),
              const CustomTextField(
                  label: Text(
                "Car Model",
                style: Style.textstyle16,
              )),
              const SizedBox(
                height: 15,
              ),
              const CustomTextField(
                  label: Text(
                "Car Number",
                style: Style.textstyle16,
              )),
              const SizedBox(
                height: 15,
              ),
              const CustomTextField(
                  label: Text(
                "Car Color",
                style: Style.textstyle16,
              )),
              const SizedBox(height: 20),
              DropdownButton(
                icon: const Icon(Icons.arrow_downward),
                alignment: Alignment.center,
                value: selectedvalue,
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
                  selectedvalue = value.toString();
                  setState(() {});
                },
              ),
              ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12))),
                      backgroundColor:
                          MaterialStateProperty.all(Colors.blue.shade800)),
                  onPressed: () =>
                      GoRouter.of(context).push(AppRoutes.Kcardetails),
                  child: const Text(
                    "Save",
                    style: Style.textstyle18,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
