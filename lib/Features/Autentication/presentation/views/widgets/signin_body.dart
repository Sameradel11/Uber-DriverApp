import 'package:drivers_app/Features/Autentication/presentation/views/widgets/custom_elevated_button.dart';
import 'package:drivers_app/Features/splash/presentation/views/const.dart';
import 'package:drivers_app/core/app_routes.dart';
import 'package:drivers_app/core/custom_text_field.dart';
import 'package:drivers_app/core/style.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignInBody extends StatelessWidget {
  const SignInBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                KlogoPath,
              ),
              const SizedBox(
                height: 20,
              ),
              Text("Log in ",
                  style:
                      Style.textstyle20.copyWith(fontWeight: FontWeight.w400)),
              const SizedBox(
                height: 15,
              ),
              const CustomTextField(
                label: Text("Email"),
                type: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 15,
              ),
              const CustomTextField(
                label: Text("Password"),
                type: TextInputType.visiblePassword,
              ),
              const SizedBox(
                height: 15,
              ),
              const CustomElevatedButton(text: "Log in "),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account, "),
                  GestureDetector(
                    child: const Text(
                      "Sign up",
                      style: Style.textstyle16,
                    ),
                    onTap: () => GoRouter.of(context).push(AppRoutes.KSignUp),
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
