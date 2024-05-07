part of 'search_bloc.dart';

class SearchState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class SearchInitial extends SearchState {
  SearchInitial({this.arrivalText = '', this.departureText = ''});
  final String arrivalText;
  final String departureText;

  @override
  List<Object?> get props => [arrivalText, departureText];
}
