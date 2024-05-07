part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class LoadOffersEvent extends HomeEvent{}

class TypeArrivalHomeEvent extends HomeEvent{
  TypeArrivalHomeEvent({required this.text});

  final String text;
}
