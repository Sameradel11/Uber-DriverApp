import 'package:drivers_app/Features/Autentication/presentation/views/widgets/custom_elevated_button.dart';
import 'package:drivers_app/Features/Autentication/presentation/views/widgets/textfield_column.dart';
import 'package:drivers_app/Features/splash/presentation/views/const.dart';
import 'package:drivers_app/core/app_routes.dart';
import 'package:drivers_app/core/style.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

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
                  style:
                      Style.textstyle20.copyWith(fontWeight: FontWeight.w500)),
              const SizedBox(
                height: 10,
              ),
              const TextFieldsColumn(),
              const CustomElevatedButton(
                text: 'Next',
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account, "),
                  GestureDetector(
                    child: const Text(
                      "Log in",
                      style: Style.textstyle16,
                    ),
                    onTap: () => GoRouter.of(context).push(AppRoutes.KSignIn),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
