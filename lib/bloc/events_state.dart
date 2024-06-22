import 'package:equatable/equatable.dart';

import '../models/event_details.dart';

abstract class EventsState extends Equatable {
  const EventsState();

  @override
  List<Object> get props => [];
}

class EventsLoading extends EventsState {}

class EventsLoaded extends EventsState {
  final List<EventDetails> events;

  const EventsLoaded(this.events);

  @override
  List<Object> get props => [events];
}

class ExpenseError extends EventsState {
  final String message;

  const ExpenseError(this.message);

  @override
  List<Object> get props => [message];
}
