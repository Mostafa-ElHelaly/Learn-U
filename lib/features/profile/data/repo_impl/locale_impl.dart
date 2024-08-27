import 'package:Learn_U/features/profile/data/data_source/locale_data_source.dart';
import 'package:Learn_U/features/profile/domain/entites/locale_entity';
import 'package:Learn_U/features/profile/domain/repo/locale_repository.dart';
import 'package:flutter/material.dart';

class LocaleRepositoryImpl implements LocaleRepository {
  final BaseLocaleDataSource dataSource;

  LocaleRepositoryImpl(this.dataSource);

  @override
  Future<void> setLocale(LocaleEntity locale) async {
    await dataSource.saveLocale(locale);
  }

  @override
  Future<LocaleEntity> getLocale() async {
    return dataSource.getLocale();
  }
}
