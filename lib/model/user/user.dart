import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

@JsonSerializable(disallowUnrecognizedKeys: true, includeIfNull: true)
class User {
  int id;
  String name;
  Color favoriteColor;

  User({required this.id, required this.name, required this.favoriteColor});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
