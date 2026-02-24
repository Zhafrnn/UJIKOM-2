import 'package:flutter/material.dart';

class UserModel extends ChangeNotifier {
  String _name = "John Doe";
  String _email = "johndoe@email.com";
  String _phone = "08123456789";

  String get name => _name;
  String get email => _email;
  String get phone => _phone;

  void updateUser({
    required String name,
    required String email,
    required String phone,
  }) {
    _name = name;
    _email = email;
    _phone = phone;
    notifyListeners();
  }
}

final user = UserModel();