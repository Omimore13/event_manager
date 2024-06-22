import 'package:equatable/equatable.dart';
import 'package:event_manager/models/event_details.dart';

abstract class EventsEvent extends Equatable {
  const EventsEvent();

  @override
  List<Object> get props => [];
}

class LoadEvents extends EventsEvent {}

class AddEvents extends EventsEvent {
  final EventDetails events;

  const AddEvents(this.events);

  @override
  List<Object> get props => [events];
}

class DeleteEvents extends EventsEvent {
  final int id;

  const DeleteEvents(this.id);

  @override
  List<Object> get props => [id];
}
