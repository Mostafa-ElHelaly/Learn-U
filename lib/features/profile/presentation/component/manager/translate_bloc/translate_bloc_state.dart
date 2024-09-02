import 'package:Learn_U/features/profile/domain/entites/locale_entity';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class LocaleState {}

class LocaleInitial extends LocaleState {}

class LocaleLoaded extends LocaleState {
  final Locale locale;

  LocaleLoaded(this.locale);
}
