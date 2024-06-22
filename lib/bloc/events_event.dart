import 'package:equatable/equatable.dart';
import 'package:event_manager/models/event_details.dart';

abstract class EventsEvent extends Equatable {
  const EventsEvent();

  @override
  List<Object> get props => [];
}

class LoadEvents extends EventsEvent {}

class AddExpense extends EventsEvent {
  final EventDetails expense;

  const AddExpense(this.expense);

  @override
  List<Object> get props => [expense];
}

class DeleteExpense extends EventsEvent {
  final int id;

  const DeleteExpense(this.id);

  @override
  List<Object> get props => [id];
}
