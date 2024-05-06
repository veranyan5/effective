// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomePageLoading extends HomeInitial {}

class HomePageLoaded extends HomeInitial {
  final List<Offer> offers;
  HomePageLoaded({
    required this.offers,
  });
}

class HomePageError extends HomeInitial {}
