import 'package:drivers_app/core/style.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/app_routes.dart';

class GoSignIn extends StatelessWidget {
  const GoSignIn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Already have an account, "),
        GestureDetector(
          child: const Text(
            "Log in",
            style: Style.textstyle16,
          ),
          onTap: () {
            GoRouter.of(context).push(AppRoutes.KSignIn);
          },
        )
      ],
    );
  }
}
