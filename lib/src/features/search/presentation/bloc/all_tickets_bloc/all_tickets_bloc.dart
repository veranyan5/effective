import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../../../core/repositories/api_service.dart';
import '../../../data/models/ticket_model.dart';

part 'all_tickets_event.dart';
part 'all_tickets_state.dart';

class AllTicketsBloc extends Bloc<AllTicketsEvent, AllTicketsState> {
  AllTicketsBloc() : super(AllTicketsInitial()) {
    on<AllTicketsEvent>((event, emit) {});
    on<GetTicketsEvent>(getTickets);
  }

  final apiService = GetIt.I.get<ApiService>();

  Future<void> getTickets(GetTicketsEvent event, Emitter<AllTicketsState> emit) async {
    emit(TicketsLoadingState());
    final response = await apiService.getTickets();
    emit(TicketsLoadedState(tickets: response.tickets));
  }

  String differenceInHours(DateTime arrivalDate, DateTime departureDate) {
    final difference = arrivalDate.difference(departureDate);

    final totalHours = difference.inMinutes / 60;
    var hours = totalHours.toInt();
    final minutes = ((totalHours - hours) * 60).toInt();
    if (minutes >= 30) {
      hours += 1;
    }

    if (minutes < 30) {
      return '$hours ч.';
    } else {
      return '$hours.5 ч.';
    }

    // return '$hours.${minutes ~/ 10}$minutes часов';
  }
}
