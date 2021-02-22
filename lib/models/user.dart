import 'dart:convert';

class User {
  String userName;
  String password;
  String phone;
  String qqToken;

  User(Map obj) {
    userName = obj['user_name'];
    password = obj['password'];
    phone = obj['phone'];
    qqToken = obj['qq_token'];
  }

  toMap() {
    return {
      'user_name': userName,
      'password': password,
      'phone': phone,
      'qq_token': qqToken,
    };
  }
}
