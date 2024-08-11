import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TranslationLoginUserDataProvider with ChangeNotifier {
  TranslationLoginUserDataProvider(String email) {
    current_user_email = email;
  }
  String current_user_email = 'none';
  void save_email(String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    current_user_email = email;
    prefs.setString("user_email", current_user_email);

    notifyListeners();
  }
}
