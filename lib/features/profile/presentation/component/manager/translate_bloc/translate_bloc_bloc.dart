import 'package:Learn_U/features/profile/domain/entites/locale_entity';
import 'package:Learn_U/features/profile/domain/use_cases/translate_uc.dart';
import 'package:Learn_U/features/profile/presentation/component/manager/translate_bloc/translate_bloc_event.dart';
import 'package:Learn_U/features/profile/presentation/component/manager/translate_bloc/translate_bloc_state.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class LocaleBloc extends Bloc<LocaleEvent, LocaleState> {
  final ChangeLocaleUseCase localeService;

  LocaleBloc({required this.localeService}) : super(LocaleInitial()) {
    on<LocaleChanged>((event, emit) async {
      await localeService.localeRepository.setLocale(event.locale);
      emit(LocaleLoaded(event.locale));
    });

    _loadInitialLocale();
  }

  Future<void> _loadInitialLocale() async {
    final locale = await localeService.localeRepository.getLocale();
    emit(LocaleLoaded(locale));
  }
}
