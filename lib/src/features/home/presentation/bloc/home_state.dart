// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

abstract class HomeState extends Equatable {}

class HomeInitialState extends HomeState {



  @override
  List<Object?> get props => [ ];
}

class HomePageLoading extends HomeState {
  @override
  List<Object?> get props => [];
}

class HomePageLoaded extends HomeState {
  final List<Offer> offers;
  HomePageLoaded({
    required this.offers,
  });
  
  @override
  List<Object?> get props => [];
}

class HomePageError extends HomeState {
  @override
  List<Object?> get props => [];

}

class HomePageSearchState extends HomeState {
  @override
  List<Object?> get props => [];

}
