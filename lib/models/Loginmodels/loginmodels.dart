import 'package:flutter/material.dart';

class LoginUserData {
  late int id;
  late String token;
  late String phone;
  late String name;
  late String email;
  late int points;
  late int credit;
  late ImageProvider image;
  LoginUserData.FromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.name = json['name'];
    this.email = json['email'];
    this.phone = json['phone'];
    this.token = json['token'];
    this.points = json['points'];
    this.credit = json['credit'];
    this.image = NetworkImage(json['image']);
  }
}

class LoginApiResponse {
  late bool status;
  late String message;
  late dynamic userData;
  LoginApiResponse.FromJson(Map<String, dynamic> json) {
    this.status = json['status'];
    this.message = json['message'];
    this.userData =
        json['data'] != null ? LoginUserData.FromJson(json['data']) : null;
  }
}
