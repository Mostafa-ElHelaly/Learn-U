import 'package:Learn_U/features/profile/domain/entites/locale_entity';
import 'package:Learn_U/features/profile/domain/use_cases/translate_uc.dart';
import 'package:Learn_U/features/profile/presentation/component/manager/translate_bloc/translate_bloc_event.dart';
import 'package:Learn_U/features/profile/presentation/component/manager/translate_bloc/translate_bloc_state.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class LocaleBloc extends Bloc<LocaleEvent, LocaleState> {
  final ChangeLocaleUseCase changeLocaleUseCase;

  LocaleBloc({required this.changeLocaleUseCase})
      : super(LocaleInitial(LocaleEntity(Locale('en', 'US')))) {
    on<LocaleChanged>(_onLocaleChanged);
  }
  Future<void> _onLocaleChanged(
      LocaleChanged event, Emitter<LocaleState> emit) async {
    final result = await changeLocaleUseCase(event.locale);
    result.fold(
      (exception) => emit(state), // Handle error if needed
      (_) => emit(LocaleInitial(event.locale)),
    );
  }
}
