import 'package:drivers_app/Features/Autentication/presentation/view_model/cubits/authcubit/sign_up_cubit.dart';
import 'package:drivers_app/Features/Autentication/presentation/views/widgets/custom_elevated_button.dart';
import 'package:drivers_app/Features/Autentication/presentation/views/widgets/go_signIn.dart';
import 'package:drivers_app/Features/Autentication/presentation/views/widgets/progress_dialog.dart';
import 'package:drivers_app/Features/Autentication/presentation/views/widgets/signup_textfield_column.dart';
import 'package:drivers_app/core/const.dart';
import 'package:drivers_app/core/app_routes.dart';
import 'package:drivers_app/core/functions.dart';
import 'package:drivers_app/core/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (BuildContext context, AuthState state) {
          if (state is AuthLoading) {
            showDialog(
              builder: (context) =>
                  const CustomProgressDialog(text: 'Creating Account'),
              context: context,
            );
          } else if (state is AuthSuccess) {
            showsnackbar("Account created successfully", context);
            GoRouter.of(context).push(AppRoutes.Kcardetails);
          } else if (state is AuthFailed) {
            showsnackbar(state.errmessage, context);
          }
        },
        builder: (context, state) {
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
                        style: Style.textstyle20
                            .copyWith(fontWeight: FontWeight.w500)),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFieldsColumn(
                      namecontroller: namecontroller,
                      emailcontroller: emailcontroller,
                      phonecontroller: phonecontroller,
                      passwordcontroller: passwordcontroller,
                    ),
                    CustomElevatedButton(
                        child: state is AuthLoading
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : const Text(
                                "Next",
                                style: Style.textstyle18,
                              ),
                        ontap: () {
                          if (formkey.currentState!.validate()) {
                            BlocProvider.of<AuthCubit>(context).signUP(
                                email: emailcontroller.text.trim(),
                                password: passwordcontroller.text.trim(),
                                name: namecontroller.text.trim(),
                                phone: phonecontroller.text.trim());
                            setState(() {});
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
        },
      ),
    );
  }

  validateForm() {
    if (!(emailcontroller.text.contains('@'))) {
      print(emailcontroller.text);
      showsnackbar("Email must contain @", context);
    } else if (emailcontroller.text.length < 3) {
      showsnackbar("Email is Wrong", context);
    } else if (passwordcontroller.text.length < 5) {
      showsnackbar("password should be at least 5 characters", context);
    } else if (phonecontroller.text.length < 11) {
      showsnackbar("Phone must be 11 numbers", context);
    }
  }
}
