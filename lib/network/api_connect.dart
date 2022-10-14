import 'dart:convert';

import 'package:bikeke_app/model/user_model.dart';
import 'package:http/http.dart' as http;

class ApiConnect {
  Future<User> loginApi(String email, String password) async {
    final response = await http.post(
      Uri.parse(
          'http://ec2-18-208-131-111.compute-1.amazonaws.com:8080/account/signIn'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{'email': email, 'password': password}),
    );
    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed');
    }
  }
}
