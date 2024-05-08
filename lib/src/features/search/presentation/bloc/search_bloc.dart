import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchInitialEvent, SearchInitial> {
  SearchBloc() : super(SearchInitial()) {
    on<SearchEvent>(
      (event, emit) => searchArrival(event, emit),
    );
    on<SetDepartureValueEvent>(setDepartureValue);
    on<ClearDepartureValueEvent>(clearDepartureValue);
  }
  TextEditingController arrivalTextController = TextEditingController();
  TextEditingController departureTextController = TextEditingController();

  void searchArrival(SearchEvent event, Emitter<SearchState> emit) {
    emit(SearchInitial(arrivalText: event.searchValue!));
  }
  

  void setDepartureValue(SetDepartureValueEvent event, Emitter<SearchState> emit) {
    departureTextController.value = TextEditingValue(text: event.departureValue);
    emit(state.copyWith(departureText: departureTextController.value.text));
  }

  void clearDepartureValue(ClearDepartureValueEvent event, Emitter<SearchState> emit) {
    departureTextController.clear();
    emit(state.copyWith(departureText: departureTextController.value.text));
  }
}
