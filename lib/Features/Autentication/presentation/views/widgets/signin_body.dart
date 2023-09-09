import 'package:drivers_app/Features/Autentication/presentation/view_model/cubits/authcubit/auth_cubit.dart';
import 'package:drivers_app/Features/Autentication/presentation/views/widgets/custom_elevated_button.dart';
import 'package:drivers_app/Features/Autentication/presentation/views/widgets/go_sign_out.dart';
import 'package:drivers_app/Features/Autentication/presentation/views/widgets/progress_dialog.dart';
import 'package:drivers_app/core/const.dart';
import 'package:drivers_app/core/app_routes.dart';
import 'package:drivers_app/core/custom_text_field.dart';
import 'package:drivers_app/core/functions.dart';
import 'package:drivers_app/core/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          Navigator.pop(context);
          print("Success");
          Future.delayed(const Duration(seconds: 2));
          GoRouter.of(context).push(AppRoutes.Kmainview);
        } else if (state is AuthFailed) {
          Navigator.pop(context);
          print('Failed');
          showsnackbar(state.errmessage, context);
        } else if (state is AuthLoading) {
          showDialog(
              context: context,
              builder: (context) =>
                  const CustomProgressDialog(text: "Loggin in ..."));
        }
      },
      builder: (context, state) {
        return SafeArea(
          child: Form(
            key: formkey,
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
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
                      child: const Text("Log in "),
                      ontap: () {
                        BlocProvider.of<AuthCubit>(context).signin(
                            email: emailcontroller.text.trim(),
                            password: passwordcontroller.text.trim());
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const GoSignUp(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
