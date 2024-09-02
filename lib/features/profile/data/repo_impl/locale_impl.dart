import 'package:Learn_U/features/profile/data/data_source/locale_data_source.dart';
import 'package:Learn_U/features/profile/domain/repo/locale_repository.dart';
import 'package:flutter/material.dart';

class LocaleRepositoryImpl implements LocaleRepository {
  final BaseLocaleDataSource dataSource;

  LocaleRepositoryImpl(this.dataSource);

  @override
  Future<Locale> getLocale() {
    return dataSource.getLocale();
  }

  @override
  Future<void> setLocale(Locale locale) {
    return dataSource.setLocale(locale);
  }
}
