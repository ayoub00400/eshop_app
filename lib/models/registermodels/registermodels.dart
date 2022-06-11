import 'package:flutter/cupertino.dart';

class RegisterUserData {
  late int id;
  late String token;
  late String phone;
  late String name;
  late String email;

  late ImageProvider image;
  RegisterUserData.FromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.name = json['name'];
    this.email = json['email'];
    this.phone = json['phone'];
    this.token = json['token'];
    this.image = NetworkImage(json['image']);
  }
}

class RegisterApiResponse {
  late bool status;
  late String message;
  late dynamic userData;
  RegisterApiResponse.FromJson(Map<String, dynamic> json) {
    this.status = json['status'];
    this.message = json['message'];
    this.userData =
        json['data'] != null ? RegisterUserData.FromJson(json['data']) : null;
  }
}
