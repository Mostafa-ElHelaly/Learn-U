import 'package:Learn_U/features/profile/domain/entites/locale_entity';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class BaseLocaleDataSource {
  Future<void> setLocale(Locale locale);
  Future<Locale> getLocale();
}

class LocaleDataSource extends BaseLocaleDataSource {
  static const _localeKey = 'app_locale';

  Future<Locale> getLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final languageCode = prefs.getString(_localeKey) ?? 'en';
    return Locale(languageCode);
  }

  Future<void> setLocale(Locale locale) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_localeKey, locale.languageCode);
  }
}
