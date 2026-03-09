import 'package:flutter/material.dart';

class UserModel extends ChangeNotifier {
  String _name = "John Doe";
  String _email = "johndoe@gmail.com";
  String _phone = "08123456789";
  String _address = "No address added";

  String get name => _name;
  String get email => _email;
  String get phone => _phone;
  String get address => _address;

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

  void updateAddress(String address) {
    _address = address;
    notifyListeners();
  }
}

final user = UserModel();