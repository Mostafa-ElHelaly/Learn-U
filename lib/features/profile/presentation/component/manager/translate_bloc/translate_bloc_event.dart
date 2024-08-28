import 'package:Learn_U/features/profile/domain/entites/locale_entity';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class LocaleEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LocaleChanged extends LocaleEvent {
  final Locale locale;

  LocaleChanged(this.locale);
}
