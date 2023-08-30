import 'package:drivers_app/Features/home/presentation/views/home_view.dart';
import 'package:drivers_app/Features/profile/presentation/views/profile_view.dart';
import 'package:drivers_app/Features/rating/presentation/views/rating_view.dart';
import 'package:flutter/material.dart';

import '../../../earning/presentation/views/earning_view.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final List views = const [
    HomeView(),
    EarningView(),
    RatingView(),
    ProfileView()
  ];
  int currentindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor: Colors.white,
            enableFeedback: true,
            currentIndex: currentindex,
            selectedItemColor: Colors.lightBlue,
            type: BottomNavigationBarType.shifting,
            onTap: (index) {
              currentindex = index;
              setState(() {});
            },
            items: [
              customnavbaritem("Home", Icons.home),
              customnavbaritem("Money", Icons.credit_card),
              customnavbaritem("Rating", Icons.star),
              customnavbaritem("Account", Icons.person),
            ]),
        body: views[currentindex]);
  }

  customnavbaritem(String label, IconData icon) {
    return BottomNavigationBarItem(
      label: label,
      icon: Icon(icon),
    );
  }
}
