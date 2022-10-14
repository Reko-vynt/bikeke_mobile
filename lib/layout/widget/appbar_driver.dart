import 'package:bikeke_app/design/app_color.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppbarDriver extends StatelessWidget {
  const AppbarDriver(
      {Key? key, this.title, this.implementLeading = false, this.titleString})
      : super(key: key);

  final Widget? title;
  final String? titleString;
  final bool implementLeading;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: 103,
            child: AppBar(
              centerTitle: true,
              automaticallyImplyLeading: false,
              elevation: 0,
              toolbarHeight: 90,
              title: title ??
                  Row(
                    children: [
                      if (implementLeading)
                        Icon(
                          FontAwesomeIcons.arrowLeftLong,
                          color: Colors.black,
                          size: 20,
                        ),
                      Expanded(
                          child: Center(
                        child: Column(children: [Text(titleString ?? '')]),
                      )),
                    ],
                  ),
              backgroundColor: AppColor().backgroundColor(),
              flexibleSpace: Stack(
                children: [Container()],
              ),
            ),
          )
        ],
      ),
    );
  }
}
