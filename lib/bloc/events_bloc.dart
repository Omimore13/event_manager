import 'package:bloc/bloc.dart';
import 'package:event_manager/bloc/events_event.dart';
import '../helpers/database_helper.dart';
import 'events_state.dart';

class EventsBloc extends Bloc<EventsEvent, EventsState> {
  final DatabaseHelper databaseHelper;

  EventsBloc(this.databaseHelper) : super(EventsLoading()) {
    on<LoadEvents>((event, emit) async {
      try {
        final events = await databaseHelper.getevents();
        emit(EventsLoaded(events));
      } catch (e) {
        emit(ExpenseError(e.toString()));
      }
    });

    on<AddEvents>((event, emit) async {
      try {
        await databaseHelper.insertExpense(event.events);
        final events = await databaseHelper.getevents();
        emit(EventsLoaded(events));
      } catch (e) {
        emit(ExpenseError(e.toString()));
      }
    });

    on<DeleteEvents>((event, emit) async {
      try {
        await databaseHelper.deleteExpense(event.id);
        final events = await databaseHelper.getevents();
        emit(EventsLoaded(events));
      } catch (e) {
        emit(ExpenseError(e.toString()));
      }
    });
  }
}
