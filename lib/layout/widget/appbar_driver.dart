import 'package:bikeke_app/design/app_color.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppbarDriver extends StatelessWidget {
  const AppbarDriver(
      {Key? key,
      this.title,
      this.implementLeading = false,
      this.titleString,
      this.height})
      : super(key: key);

  final Widget? title;
  final String? titleString;
  final bool implementLeading;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: height,
            child: AppBar(
              centerTitle: true,
              automaticallyImplyLeading: false,
              elevation: 0,
              toolbarHeight: 90,
              title: title ??
                  Row(
                    children: [
                      if (implementLeading)
                        IconButton(
                          icon: Icon(FontAwesomeIcons.arrowLeftLong),
                          color: Colors.black,
                          onPressed: () {
                            Navigator.pop(context);
                          },
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
          ),
        ],
      ),
    );
  }
}
