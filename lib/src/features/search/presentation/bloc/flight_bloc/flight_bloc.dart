import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../../../core/repositories/api_service.dart';
import '../../../data/models/ticket_offer_model.dart';

part 'flight_event.dart';
part 'flight_state.dart';

class FlightBloc extends Bloc<FlightEvent, FlightState> {
  FlightBloc() : super(FlightInitial()) {
    on<FlightEvent>((event, emit) {});
    on<GetTicketOffersEvent>(getTicketOffers);
  }
  final apiService = GetIt.I.get<ApiService>();
  Future<void> getTicketOffers(GetTicketOffersEvent event, Emitter<FlightState> emit) async {
    emit(FlightLoadingState());
    final response = await apiService.getTicketOffers();
    emit(FlightLoadedState(ticketOffers: response.ticketsOffers));
  }
}
