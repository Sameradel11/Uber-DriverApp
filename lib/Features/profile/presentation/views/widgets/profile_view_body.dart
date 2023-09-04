import 'package:drivers_app/Features/Autentication/presentation/view_model/cubits/authcubit/sign_up_cubit.dart';
import 'package:drivers_app/Features/Autentication/presentation/views/widgets/custom_elevated_button.dart';
import 'package:drivers_app/Features/Autentication/presentation/views/widgets/progress_dialog.dart';
import 'package:drivers_app/core/app_routes.dart';
import 'package:drivers_app/core/functions.dart';
import 'package:drivers_app/core/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
        builder: (context, state) => Center(
              child: CustomElevatedButton(
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "SignOut",
                        style: Style.textstyle18,
                      ),
                      Icon(Icons.login_outlined)
                    ],
                  ),
                  ontap: () {
                    BlocProvider.of<AuthCubit>(context).signout();
                  }),
            ),
        listener: (context, state) {
          if (state is AuthSuccess) {
            GoRouter.of(context).pushReplacement(AppRoutes.Ksplasview);
          } else if (state is AuthLoading) {
            showDialog(
                context: context,
                builder: (context) => const CustomProgressDialog(
                      text: 'Signing out ...',
                    ));
          } else if (state is AuthFailed) {
            showsnackbar(state.errmessage, context);
          }
        });
  }
}
