import 'package:equatable/equatable.dart';

abstract class BaseGetCountriesEvent extends Equatable {
  const BaseGetCountriesEvent();

  @override
  List<Object> get props => [];
}

class GetCountriesEvent extends BaseGetCountriesEvent {

}
