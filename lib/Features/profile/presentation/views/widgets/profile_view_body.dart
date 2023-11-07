import 'package:drivers_app/Features/Autentication/presentation/view_model/cubits/authcubit/auth_cubit.dart';
import 'package:drivers_app/Features/Autentication/presentation/views/widgets/custom_elevated_button.dart';
import 'package:drivers_app/Features/Autentication/presentation/views/widgets/progress_dialog.dart';
import 'package:drivers_app/Features/profile/data/driver_model.dart';
import 'package:drivers_app/Features/profile/presentation/view_model/cubit/fetchuserdata_cubit.dart';
import 'package:drivers_app/core/app_routes.dart';
import 'package:drivers_app/core/functions.dart';
import 'package:drivers_app/core/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProfileViewBody extends StatefulWidget {
  const ProfileViewBody({super.key});

  @override
  State<ProfileViewBody> createState() => _ProfileViewBodyState();
}

class _ProfileViewBodyState extends State<ProfileViewBody> {
  UserModel? user;

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<AuthCubit, AuthState>(listener: (context, state) {
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
        }),
        BlocListener<FetchuserdataCubit, FetchuserdataState>(
            listener: (context, state) {
          if (state is FetchdataSuccess) {
            user = state.user;
            showsnackbar("USerDdate", context);
            print(user);
          }
        })
      ],
      child: Center(
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
    );
  }
}
