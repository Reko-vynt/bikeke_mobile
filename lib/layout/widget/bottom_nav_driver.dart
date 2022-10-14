import 'package:bikeke_app/design/app_color.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class BottomNavBarDriver extends StatelessWidget {
  const BottomNavBarDriver({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SalomonBottomBar(
      items: [
        SalomonBottomBarItem(
            icon: Icon(FontAwesomeIcons.horse), title: Text('Home')),
      ],
    );
  }
}
