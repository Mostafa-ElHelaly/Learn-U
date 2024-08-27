import 'package:Learn_U/features/profile/domain/entites/locale_entity';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class LocaleState extends Equatable {
  @override
  List<Object> get props => [];
}

class LocaleInitial extends LocaleState {
  final LocaleEntity locale;

  LocaleInitial(this.locale);

  @override
  List<Object> get props => [locale];
}
