import 'package:drivers_app/Features/Autentication/presentation/views/widgets/textfield_column.dart';
import 'package:drivers_app/Features/splash/presentation/views/const.dart';
import 'package:drivers_app/core/app_routes.dart';
import 'package:drivers_app/core/style.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignIN extends StatelessWidget {
  const SignIN({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              KlogoPath,
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
                onPressed: () =>
                    GoRouter.of(context).push(AppRoutes.Kcardetails),
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
