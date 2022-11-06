import 'dart:ffi';
import 'dart:typed_data';

import 'package:bikeke_app/layout/home_driver.dart';
import 'package:bikeke_app/service/google_auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_one_tap_sign_in/google_one_tap_sign_in.dart';

import '../design/app_color.dart';
import '../service/firebase_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

final String _webClientId =
    "665971199801-uucsekt36jt716qr607r2rieeqsrulhb.apps.googleusercontent.com";
void _onSignIn(BuildContext context) async {
  var data = await GoogleOneTapSignIn.startSignIn(webClientId: _webClientId);
  if (data != null) {
    /// Whatever you do with [SignInResult] data
    print("Id Token : ${data.idToken ?? "-"}");
    print("ID : ${data.id ?? "-"}");
    print("ID : ${data.googleIdToken ?? "-"}");
    print('ID TOKEN');
    String token = data.idToken;
    String idtoken = "";
    while (token.length > 0) {
      int initLength = (token.length >= 500 ? 500 : token.length);
      print(token.substring(0, initLength));
      idtoken = idtoken + token.substring(0, initLength);
      int endLength = token.length;
      token = token.substring(initLength, endLength);
    }
    Future.delayed(Duration(seconds: 1), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeDriver()));
    });
  }
}

void _onSignInWithHandle(BuildContext context) async {
  var result = await GoogleOneTapSignIn.handleSignIn(webClientId: _webClientId);

  if (result.isTemporaryBlock) {
    // TODO: Tell your users about this status
    print("Temporary BLOCK");
  }

  if (result.isCanceled) {
    // TODO: Tell your users about this status
    print("Canceled");
  }

  if (result.isFail) {
    // TODO: Tell your users about this status
  }

  if (result.isOk) {
    // TODO: Whatever you do with [SignInResult] data
    print("OK");
    print("Id Token : ${result.data?.idToken ?? "-"}");
    print("Email : ${result.data?.username ?? "-"}");
    String token = result.data?.idToken;
    String idtoken = "";
    while (token.length > 0) {
      int initLength = (token.length >= 500 ? 500 : token.length);
      print(token.substring(0, initLength));
      idtoken = idtoken + token.substring(0, initLength);
      int endLength = token.length;
      token = token.substring(initLength, endLength);
    }
    Future.delayed(Duration(seconds: 1), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeDriver()));
    });
  }
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
              _onSignIn(context);
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
              // login(context, emailController.text, passwordController.text);
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
