import 'package:flutter/material.dart';
import 'package:testriver/model/user/user.dart';
import 'package:testriver/utils/delay.dart';

List<User> dataList = [
  User.fromJson({
    "name": "Shekhar",
    "id": 1,
    "favoriteColor": Colors.red,
  }),
  User.fromJson({
    "name": "Shashank",
    "id": 2,
    "favoriteColor": Colors.amber,
  }),
  User.fromJson({
    "name": "Abhishek",
    "id": 3,
    "favoriteColor": Colors.orangeAccent,
  }),
  User.fromJson({
    "name": "Kumar Abhishek",
    "id": 4,
    "favoriteColor": Colors.red,
  }),
  User.fromJson({
    "name": "Nirban",
    "id": 5,
    "favoriteColor": Colors.orange,
  }),
  User.fromJson({
    "name": "Naveen",
    "id": 6,
    "favoriteColor": Colors.yellow,
  }),
  User.fromJson({
    "name": "Kumar Naveen",
    "id": 7,
    "favoriteColor": Colors.orangeAccent,
  }),
  User.fromJson({
    "name": "Atul",
    "id": 8,
    "favoriteColor": Colors.amber,
  }),
  User.fromJson({
    "name": "Prakash",
    "id": 9,
    "favoriteColor": Colors.amber,
  }),
  User.fromJson({
    "name": "Vinay",
    "id": 10,
    "favoriteColor": Colors.red,
  }),
  User.fromJson({
    "name": "Atul",
    "id": 11,
    "favoriteColor": Colors.red,
  }),
  User.fromJson({
    "name": "Kumar Atul",
    "id": 12,
    "favoriteColor": Colors.amber,
  }),
  User.fromJson({
    "name": "Manoj",
    "id": 13,
    "favoriteColor": Colors.orangeAccent,
  }),
  User.fromJson({
    "name": "Kumar Vipul",
    "id": 14,
    "favoriteColor": Colors.red,
  }),
  User.fromJson({
    "name": "Harhsit",
    "id": 15,
    "favoriteColor": Colors.orange,
  }),
  User.fromJson({
    "name": "Anuj",
    "id": 16,
    "favoriteColor": Colors.yellow,
  }),
  User.fromJson({
    "name": " Reddy",
    "id": 17,
    "favoriteColor": Colors.orangeAccent,
  }),
  User.fromJson({
    "name": "Ravi",
    "id": 18,
    "favoriteColor": Colors.amber,
  }),
  User.fromJson({
    "name": "Salmon Boi",
    "id": 19,
    "favoriteColor": Colors.amber,
  }),
  User.fromJson({
    "name": "Manvinder",
    "id": 20,
    "favoriteColor": Colors.red,
  }),
];

class GetData {
  static Future<List<User>> getAllUser() async {
    await addDelay(2000);
    return dataList;
  }

  static Future<List<User>> getUserByColor(Color filterColor) async {
    await addDelay(2000);
    List<User> list = [];

    for (var e in dataList) {
      print(
          "$filterColor == ${e.favoriteColor} = ${filterColor == e.favoriteColor}");
      if (filterColor == e.favoriteColor) {
        list.add(e);
      }
    }
    return list;
  }
}
