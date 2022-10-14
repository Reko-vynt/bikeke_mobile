import 'package:bikeke_app/layout/widget/bottom_nav_driver.dart';
import 'package:flutter/material.dart';

class HomeDriver extends StatelessWidget {
  const HomeDriver({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavBarDriver(),
    );
  }
}
