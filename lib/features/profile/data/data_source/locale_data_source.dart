import 'package:Learn_U/features/profile/domain/entites/locale_entity';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class BaseLocaleDataSource {
  Future<void> saveLocale(LocaleEntity locale);
  LocaleEntity getLocale();
}

class LocaleDataSource extends BaseLocaleDataSource {
  final SharedPreferences preferences;
  LocaleDataSource({required this.preferences});

  // Constructor with correct syntax
  Future<void> saveLocale(LocaleEntity locale) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("locale", locale.locale.toString());
  }

  // Retrieve locale from SharedPreferences
  LocaleEntity getLocale() {
    final localeString = preferences.getString('locale') ?? 'en_US';
    return LocaleEntity(Locale(localeString));
  }
}
