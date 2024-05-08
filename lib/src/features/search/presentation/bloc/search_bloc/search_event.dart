part of 'search_bloc.dart';

sealed class SearchInitialEvent extends Equatable {}

class SearchEvent extends SearchInitialEvent {
  SearchEvent({this.searchValue = ''});
  final String? searchValue;
  @override
  List<Object?> get props => [searchValue];
}

class SetDepartureValueEvent extends SearchInitialEvent {
  SetDepartureValueEvent({required this.departureValue});

  final String departureValue;

  @override
  List<Object?> get props => [departureValue];
}

class ClearDepartureValueEvent extends SearchInitialEvent {
  @override
  List<Object?> get props => [];
}

class SwapControllersEvent extends SearchInitialEvent {
  @override
  List<Object?> get props => [];
}

class InitCurrentDateTimeEvent extends SearchInitialEvent {
  @override
  List<Object?> get props => [];
}
class PickArrivalDateTimeEvent extends SearchInitialEvent {
  PickArrivalDateTimeEvent({required this.arrivalDateTime});

  final DateTime arrivalDateTime;

  @override
  List<Object?> get props => [arrivalDateTime];
}
class PickDepartureDateTimeEvent extends SearchInitialEvent {
  PickDepartureDateTimeEvent({required this.departureDateTime});

  final DateTime departureDateTime;
  @override
  List<Object?> get props => [departureDateTime];
}
