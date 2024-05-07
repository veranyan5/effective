import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../data/models/offer_model.dart';
import '../../domain/usecases/api_service.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitialState()) {
    on<LoadOffersEvent>((event, emit) async => getOffers(event, emit));
    on<TypeArrivalHomeEvent>((event, emit) => typeArrival(event, emit));
  }

  final ApiService apiService = GetIt.I.get<ApiService>();

  Future<void> getOffers(HomeEvent event, Emitter<HomeState> emit) async {
    emit(HomePageLoading());
    final response = await apiService.getOffers();
    inspect(response);
    emit(HomePageLoaded(offers: response.offers ?? []));
  }

  void typeArrival(TypeArrivalHomeEvent event, Emitter<HomeState> emit) {
    emit(HomePageSearchState());
  }
}
