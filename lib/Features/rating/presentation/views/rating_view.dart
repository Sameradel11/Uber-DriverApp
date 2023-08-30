import 'package:drivers_app/Features/rating/presentation/views/widgets/rating_body.dart';
import 'package:flutter/material.dart';

class RatingView extends StatelessWidget {
  const RatingView({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:  RatingBody(),
    );
  }
}
