import 'package:drivers_app/core/app_routes.dart';
import 'package:drivers_app/core/style.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
class GoSignUp extends StatelessWidget {
  const GoSignUp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
