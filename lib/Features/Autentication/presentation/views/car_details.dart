import 'package:flutter/material.dart';

import 'widgets/car_details/car_details_body.dart';

class CarDetails extends StatelessWidget {
  const CarDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CarDetailsBody(),
    );
  }
}
