// ignore_for_file: omit_local_variable_types

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchInitialEvent, SearchInitial> {
  SearchBloc() : super(SearchInitial()) {
    on<SearchEvent>((event, emit) => searchArrival(event, emit));
    on<SetDepartureValueEvent>(setDepartureValue);
    on<ClearDepartureValueEvent>(clearDepartureValue);
    on<SwapControllersEvent>(swapControllersText);
    on<InitCurrentDateTimeEvent>(initCurrentDateTime);
    on<PickArrivalDateTimeEvent>(pickArrivalDate);
    on<PickDepartureDateTimeEvent>(pickDepartureDate);
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

  void swapControllersText(SwapControllersEvent event, Emitter<SearchState> emit) {
    final arrivalText = arrivalTextController.value.text;
    final departureText = departureTextController.value.text;
    arrivalTextController.value = TextEditingValue(text: departureText);
    departureTextController.value = TextEditingValue(text: arrivalText);
    emit(
      state.copyWith(
        departureText: departureTextController.value.text,
        arrivalText: arrivalTextController.value.text,
      ),
    );
  }

  String formatDateTime(DateTime date) {
    initializeDateFormatting('ru');

    return DateFormat('d MMM, E', 'ru').format(date);
  }

  void initCurrentDateTime(InitCurrentDateTimeEvent event, Emitter<SearchState> emit) {
    emit(state.copyWith(arrivalDateTime: DateTime.now()));
  }

  void pickArrivalDate(PickArrivalDateTimeEvent event, Emitter<SearchState> emit) {
    emit(state.copyWith(arrivalDateTime: event.arrivalDateTime));
  }

  void pickDepartureDate(PickDepartureDateTimeEvent event, Emitter<SearchState> emit) {
    emit(state.copyWith(departureDateTime: event.departureDateTime));
  }
}
