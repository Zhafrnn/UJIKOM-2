import 'package:flutter/material.dart';

class UserModel extends ChangeNotifier {
  String _name = "John Doe";
  String _email = "johndoe@gmail.com";

  String _phone = "08123456789";
  String _address = "";
  String _city = "";
  String _postalCode = "";
  String _notes = "";

  String? _photoPath; // 🔥 FOTO PROFILE

  String get name => _name;
  String get email => _email;

  String get phone => _phone;
  String get address => _address;
  String get city => _city;
  String get postalCode => _postalCode;
  String get notes => _notes;

  String? get photoPath => _photoPath; // 🔥 GETTER FOTO

  void updateUser({required String name, required String email}) {
    _name = name;
    _email = email;
    notifyListeners();
  }

  void updateAddress({
    required String address,
    required String city,
    required String postalCode,
    required String phone,
    required String notes,
  }) {
    _address = address;
    _city = city;
    _postalCode = postalCode;
    _phone = phone;
    _notes = notes;

    notifyListeners();
  }

  // 🔥 UPDATE FOTO PROFILE
  void updatePhoto(String path) {
    _photoPath = path;
    notifyListeners();
  }
}

final user = UserModel();
