import 'package:bloc/bloc.dart';
import 'package:event_manager/bloc/events_event.dart';
import '../helpers/database_helper.dart';
import 'events_state.dart';

class EventsBloc extends Bloc<EventsEvent, EventsState> {
  final DatabaseHelper databaseHelper;

  EventsBloc(this.databaseHelper) : super(EventsLoading()) {
    on<LoadEvents>((event, emit) async {
      try {
        final expenses = await databaseHelper.getExpenses();
        emit(EventsLoaded(expenses));
      } catch (e) {
        emit(ExpenseError(e.toString()));
      }
    });

    on<AddExpense>((event, emit) async {
      try {
        await databaseHelper.insertExpense(event.expense);
        final expenses = await databaseHelper.getExpenses();
        emit(EventsLoaded(expenses));
      } catch (e) {
        emit(ExpenseError(e.toString()));
      }
    });

    on<DeleteExpense>((event, emit) async {
      try {
        await databaseHelper.deleteExpense(event.id);
        final expenses = await databaseHelper.getExpenses();
        emit(EventsLoaded(expenses));
      } catch (e) {
        emit(ExpenseError(e.toString()));
      }
    });
  }
}
