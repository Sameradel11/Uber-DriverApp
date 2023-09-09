import 'package:drivers_app/Features/Autentication/presentation/views/widgets/car_details/car_details_textfields.dart';
import 'package:drivers_app/Features/Autentication/presentation/views/widgets/custom_elevated_button.dart';
import 'package:drivers_app/Features/Autentication/presentation/views/widgets/progress_dialog.dart';
import 'package:drivers_app/core/const.dart';
import 'package:drivers_app/core/app_routes.dart';
import 'package:drivers_app/core/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';

import '../../../view_model/cubits/authcubit/auth_cubit.dart';

class CarDetailsBody extends StatefulWidget {
  const CarDetailsBody({super.key});

  @override
  State<CarDetailsBody> createState() => _CarDetailsBodyState();
}

class _CarDetailsBodyState extends State<CarDetailsBody> {
  final TextEditingController carModelcontroller = TextEditingController();
  final TextEditingController carNumbercontroller = TextEditingController();
  final TextEditingController carColorcontroller = TextEditingController();
  final formkey = GlobalKey<FormState>();
  String? selectedvalue;
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formkey,
        child: BlocProvider(
          create: (context) => AuthCubit(),
          child: BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is AuthSuccess) {
                showDialog(
                  builder: (context) =>
                      const CustomProgressDialog(text: 'Saving car info'),
                  context: context,
                );
                GoRouter.of(context).push(AppRoutes.Kmainview);
              } else if (state is AuthFailed) {
                Fluttertoast.showToast(msg: state.errmessage);
              }
            },
            builder: (context, state) {
              return SafeArea(
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
                    CarDetailsTextFields(
                      carModelcontroller: carModelcontroller,
                      carNumbercontroller: carNumbercontroller,
                      carColorcontroller: carColorcontroller,
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 90.0,
                      ),
                      child: DropdownButtonFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please select a value";
                          }
                          return null;
                        },
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
                    ),
                    const SizedBox(height: 20),
                    const SizedBox(
                      height: 50,
                    ),
                    CustomElevatedButton(
                      ontap: () {
                        if (formkey.currentState!.validate()) {
                          Map<String, String> cardetails = {
                            "car_model": carModelcontroller.text.trim(),
                            "car_number": carNumbercontroller.text.trim(),
                            "car_color": carColorcontroller.text.trim(),
                            "car_type": selectedvalue!.trim()
                          };
                          BlocProvider.of<AuthCubit>(context)
                              .savecardetails(cardetails: cardetails);
                        }
                      },
                      child: state is AuthLoading
                          ? const CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : const Text(
                              "Save",
                              style: Style.textstyle18,
                            ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
