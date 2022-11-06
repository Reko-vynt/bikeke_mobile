import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_one_tap_sign_in/google_one_tap_sign_in.dart';
import 'package:jwt_decode/jwt_decode.dart';

class MyApp1 extends StatefulWidget {
  const MyApp1({Key? key}) : super(key: key);

  @override
  State<MyApp1> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp1> {
  // Your Web Client Id
  final String _webClientId =
      "942223948625-jhg9ibpevvr0r0l42h79u875u1autab0.apps.googleusercontent.com";

  File? _image;

  @override
  void initState() {
    super.initState();
    print("INIT STATE");
  }

  void _onSignIn() async {
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
      print("ID : ${idtoken.length}");
    }
  }

  void _onSignInWithHandle() async {
    var result =
        await GoogleOneTapSignIn.handleSignIn(webClientId: _webClientId);

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
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Google One Tap Sign In'),
        ),
        body: Center(
          child: ListView(
            shrinkWrap: true,
            children: [
              TextButton(
                child: const Text("Sign In"),
                onPressed: () => _onSignIn(),
              ),
              TextButton(
                child: const Text("Sign In With Handle"),
                onPressed: () => _onSignInWithHandle(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
