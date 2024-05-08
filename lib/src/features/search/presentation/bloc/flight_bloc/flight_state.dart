part of 'flight_bloc.dart';

sealed class FlightState extends Equatable {
  const FlightState();

  @override
  List<Object> get props => [];
}

final class FlightInitial extends FlightState {}

final class FlightLoadingState extends FlightState {}

final class FlightLoadedState extends FlightState {
  const FlightLoadedState({required this.ticketOffers});

  final List<TicketsOffer>? ticketOffers;
}

final class FlightLoadingErrorState extends FlightState {}
