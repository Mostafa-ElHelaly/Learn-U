import 'dart:ui';

import 'package:Learn_U/features/profile/domain/entites/locale_entity';
import 'package:Learn_U/features/profile/domain/repo/locale_repository.dart';
import 'package:dartz/dartz.dart';

class ChangeLocaleUseCase {
  final LocaleRepository localeRepository;

  // Constructor
  ChangeLocaleUseCase({
    required this.localeRepository,
  });

  // Execute method to change locale
  Future<Either<Exception, void>> call(Locale locale) async {
    try {
      await localeRepository.setLocale(locale);
      await localeRepository.getLocale();
      return Right(null); // Use Right to indicate success
    } catch (e) {
      return Left(e as Exception); // Use Left to indicate failure
    }
  }
}
