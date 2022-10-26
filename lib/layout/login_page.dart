import 'dart:ffi';
import 'dart:typed_data';

import 'package:bikeke_app/layout/home_driver.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../design/app_color.dart';
import '../service/firebase_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

login(BuildContext context, String email, String password) {
  // ApiConnect()
  //     .loginApi(email, password)
  //     .then((data) => {
  //           Future.delayed(Duration(seconds: 1), () {
  //             Navigator.push(context,
  //                 MaterialPageRoute(builder: (context) => LoginPage()));
  //           })
  //         })
  //     .catchError((e) {
  //   showDialog(
  //     context: context,
  //     builder: (context) {
  //       return AlertDialog(
  //         content: Text("Login Faled !!"),
  //       );
  //     },
  //   );
  // });
  Future.delayed(Duration(seconds: 1), () {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomeDriver()));
  });
}

class _LoginPageState extends State<LoginPage> {
  final Storage storage = Storage();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [
        SystemUiOverlay.bottom, // Shows Status bar and hides Navigation bar
      ],
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColor().backgroundColor(),
      body: SizedBox(
        height: double.infinity,
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          FutureBuilder(
            future: storage.logoUrl(),
            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
              if (snapshot.hasData) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 70, 0, 30),
                      child: SizedBox(
                        width: width * 0.7,
                        child: Image.network(
                          snapshot.data!,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                );
              }
              if (!snapshot.hasData) {
                return CircularProgressIndicator();
              }
              return Container();
            },
          ),
          FloatingActionButton(
            backgroundColor: Colors.white,
            shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            onPressed: () {
              showDialog(
                barrierColor: Color(0x01000000),
                context: context,
                builder: (context) {
                  return SizedBox(
                    width: 50,
                    height: 50,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                },
              );
              login(context, emailController.text, passwordController.text);
            },
            child: Text(
              "Login",
              style: TextStyle(color: AppColor().textColor()),
            ),
          )
        ]),
      ),
    );
  }
}
