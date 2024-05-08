part of 'all_tickets_bloc.dart';

sealed class AllTicketsEvent extends Equatable {
  const AllTicketsEvent();

  @override
  List<Object> get props => [];
}

class GetTicketsEvent extends AllTicketsEvent {}
