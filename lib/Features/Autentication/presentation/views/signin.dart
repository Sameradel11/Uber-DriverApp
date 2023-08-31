import 'package:drivers_app/Features/Autentication/presentation/views/widgets/textfield_column.dart';
import 'package:drivers_app/Features/splash/presentation/views/const.dart';
import 'package:drivers_app/core/style.dart';
import 'package:flutter/material.dart';

class SignIN extends StatelessWidget {
  const SignIN({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          children: [
            Image.asset(
              KlogoPath,
              scale: 2,
            ),
            const SizedBox(
              height: 20,
            ),
            Text("Register as a Driver",
                style: Style.textstyle20.copyWith(fontWeight: FontWeight.w500)),
            const SizedBox(
              height: 10,
            ),
            const TextFieldsColumn(),
            ElevatedButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12))),
                    backgroundColor:
                        MaterialStateProperty.all(Colors.blue.shade800)),
                onPressed: () {},
                child: const Text(
                  "Create Account",
                  style: Style.textstyle18,
                )),
          ],
        )),
      ),
    );
  }
}
