part of 'search_bloc.dart';

class SearchState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class SearchInitial extends SearchState {
  SearchInitial({
    this.arrivalText = '',
    this.departureText = '',
    this.arrivalDateTime,
    this.departureDateTime,
  });
  final String arrivalText;
  final String departureText;
  final DateTime? arrivalDateTime;
  final DateTime? departureDateTime;

  SearchInitial copyWith({
    String? arrivalText,
    String? departureText,
    DateTime? arrivalDateTime,
    DateTime? departureDateTime,
  }) {
    return SearchInitial(
      arrivalText: arrivalText ?? this.arrivalText,
      departureText: departureText ?? this.departureText,
      arrivalDateTime: arrivalDateTime ?? this.arrivalDateTime,
      departureDateTime: departureDateTime ?? this.departureDateTime,
    );
  }

  @override
  List<Object?> get props => [arrivalText, departureText, arrivalDateTime, departureDateTime];
}
