import 'package:drivers_app/Features/Autentication/presentation/views/widgets/custom_elevated_button.dart';
import 'package:drivers_app/Features/Autentication/presentation/views/widgets/go_signIn.dart';
import 'package:drivers_app/Features/Autentication/presentation/views/widgets/textfield_column.dart';
import 'package:drivers_app/Features/splash/presentation/views/const.dart';
import 'package:drivers_app/core/app_routes.dart';
import 'package:drivers_app/core/style.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignUpBody extends StatefulWidget {
  const SignUpBody({
    super.key,
  });

  @override
  State<SignUpBody> createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
  final formkey = GlobalKey<FormState>();
  final namecontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final phonecontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Form(
          key: formkey,
          child: Column(
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
              CustomElevatedButton(
                  text: 'Next',
                  ontap: () {
                    if (formkey.currentState!.validate()) {
                      GoRouter.of(context).push(AppRoutes.Kcardetails);
                    }
                  }),
              const SizedBox(height: 10),
              const GoSignIn(),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
