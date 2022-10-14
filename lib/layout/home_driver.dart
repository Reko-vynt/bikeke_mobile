import 'package:bikeke_app/design/app_color.dart';
import 'package:bikeke_app/layout/widget/appbar_driver.dart';
import 'package:bikeke_app/layout/widget/bottom_nav_driver.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeDriver extends StatelessWidget {
  const HomeDriver({Key? key, this.userName = 'Driver'}) : super(key: key);

  final String? userName;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
    return Scaffold(
      body: Stack(children: [
        AppbarDriver(
          title: Row(children: [
            Row(
              children: [
                CircleAvatar(),
                Text(
                  'Welcome,$userName',
                  style: TextStyle(color: AppColor().textColor()),
                )
              ],
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.white),
                    child: Icon(
                      FontAwesomeIcons.bell,
                      size: 20,
                      color: Colors.black,
                    ))
              ],
            )
          ]),
          implementLeading: true,
          titleString: "Plan",
        ),
        Container(
          margin: EdgeInsets.only(top: 103),
          color: Colors.yellow,
          child: Column(
            children: [
              Row(
                children: [
                  Column(
                    children: [
                      FloatingActionButton(
                        onPressed: () {},
                        child: Icon(FontAwesomeIcons.avianex),
                      ),
                      Text('Work')
                    ],
                  )
                ],
              )
            ],
          ),
        )
      ]),
      bottomNavigationBar: BottomNavBarDriver(),
    );
  }
}
