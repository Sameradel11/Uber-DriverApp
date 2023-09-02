import 'package:drivers_app/Features/Autentication/presentation/views/widgets/custom_elevated_button.dart';
import 'package:drivers_app/Features/Autentication/presentation/views/widgets/progress_dialog.dart';
import 'package:drivers_app/Features/splash/presentation/views/const.dart';
import 'package:drivers_app/core/app_routes.dart';
import 'package:drivers_app/core/custom_text_field.dart';
import 'package:drivers_app/core/functions.dart';
import 'package:drivers_app/core/style.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignInBody extends StatefulWidget {
  const SignInBody({super.key});

  @override
  State<SignInBody> createState() => _SignInBodyState();
}

class _SignInBodyState extends State<SignInBody> {
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final formkey = GlobalKey<FormState>();

    @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Form(
        key: formkey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * .13),
                Image.asset(
                  KlogoPath,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text("Log in ",
                    style: Style.textstyle20
                        .copyWith(fontWeight: FontWeight.w400)),
                const SizedBox(
                  height: 15,
                ),
                CustomTextField(
                  controller: emailcontroller,
                  label: const Text("Email"),
                  type: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextField(
                  controller: passwordcontroller,
                  hidetext: true,
                  label: const Text("Password"),
                  type: TextInputType.visiblePassword,
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomElevatedButton(
                  text: "Log in ",
                  ontap: () {
                    validateform();
                  },
                ),
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
                      onTap: () {
                        GoRouter.of(context).push(AppRoutes.KSignUp);
                      },
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  validateform() {
    if (formkey.currentState!.validate()) {
      if (!(emailcontroller.text.contains('@'))) {
        print(emailcontroller.text);
        showsnackbar("Email must contain @", context);
      } else if (emailcontroller.text.length < 3) {
        showsnackbar("Email is Wrong", context);
      } else if (passwordcontroller.text.length < 5) {
        showsnackbar("password should be at least 5 characters", context);
      } else {
        showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) => const ProgressDialog());
      }
    }
  }
}
