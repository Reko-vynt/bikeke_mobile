// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    required this.id,
    required this.email,
    required this.phone,
    required this.name,
    required this.gender,
    required this.img,
    required this.createdDate,
  });

  int id;
  String email;
  String phone;
  String name;
  String gender;
  String? img;
  DateTime createdDate;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        email: json["email"],
        phone: json["phone"],
        name: json["name"],
        gender: json["gender"],
        img: json["img"],
        createdDate: DateTime.parse(json["createdDate"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "phone": phone,
        "name": name,
        "gender": gender,
        "img": img,
        "createdDate": createdDate.toIso8601String(),
      };
}
