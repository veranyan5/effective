part of 'all_tickets_bloc.dart';

sealed class AllTicketsState extends Equatable {
  const AllTicketsState();
  
  @override
  List<Object> get props => [];
}

final class AllTicketsInitial extends AllTicketsState {}

final class TicketsLoadingState extends AllTicketsState {}

final class TicketsLoadedState extends AllTicketsState {
  const TicketsLoadedState({required this.tickets});

  final List<Ticket>? tickets;
}

final class TicketsLoadingErrorState extends AllTicketsState {}
