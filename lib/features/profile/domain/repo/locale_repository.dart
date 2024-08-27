import 'package:Learn_U/features/profile/domain/entites/locale_entity';
import 'package:flutter/material.dart';

abstract class LocaleRepository {
  Future<void> setLocale(LocaleEntity locale);
  Future<LocaleEntity> getLocale();
}
