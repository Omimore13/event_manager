import 'package:equatable/equatable.dart';

import '../models/event_details.dart';

abstract class EventsState extends Equatable {
  const EventsState();

  @override
  List<Object> get props => [];
}

class EventsLoading extends EventsState {}

class EventsLoaded extends EventsState {
  final List<EventDetails> expenses;

  const EventsLoaded(this.expenses);

  @override
  List<Object> get props => [expenses];
}

class ExpenseError extends EventsState {
  final String message;

  const ExpenseError(this.message);

  @override
  List<Object> get props => [message];
}
