import 'package:event_manager/bloc/events_event.dart';
import 'package:event_manager/bloc/events_state.dart';
import 'package:event_manager/helpers/database_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import '../bloc/events_bloc.dart';
import '../models/event_details.dart';
import '../static_methods/styles.dart';

class CreateEventScreen extends StatelessWidget {
  final DateTime date;

  CreateEventScreen({required this.date});

  final TextEditingController _dateCtrl = TextEditingController();
  final TextEditingController _titleCtrl = TextEditingController();
  final TextEditingController _descriptionCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EventsBloc(DatabaseHelper()),
      child: Scaffold(
        backgroundColor: Clr().white,
        appBar: AppBar(
          leading: Center(
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Text(
                "Back",
                style: Sty().mediumText.copyWith(color: Clr().white),
              ),
            ),
          ),
          title: Text(
            'Event Detail',
            style: Sty().largeText.copyWith(
                color: Clr().white, fontSize: 22, fontWeight: FontWeight.w800),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Clr().primaryColor,
        ),
        body: BlocBuilder<EventsBloc, EventsState>(
          builder: (context, state) {
            return Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Date & Time',
                              style: Sty().mediumText.copyWith(
                                  color: Clr().black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Expanded(
                              child: TextFormField(
                                controller: _dateCtrl,
                                onTapOutside: (event) {
                                  FocusScope.of(context).unfocus();
                                },
                                cursorColor: Clr().black,
                                style: Sty()
                                    .smallText
                                    .copyWith(color: Clr().black),
                                maxLength: 5,
                                keyboardType: TextInputType.datetime,
                                textInputAction: TextInputAction.done,
                                obscureText: false,
                                decoration: Sty()
                                    .textFieldOutlineStyle
                                    .copyWith(
                                      fillColor: Clr().white,
                                      filled: true,
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(width: 0.1),
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: BorderSide(
                                          color: _titleCtrl.text.isNotEmpty
                                              ? Clr().primaryColor
                                              : Clr().textSecondary,
                                        ),
                                      ),
                                      hintStyle: Sty().smallText.copyWith(
                                            color: Clr().textSecondary,
                                          ),
                                      hintText: "HH:MM",
                                      counterText: "",
                                      contentPadding: EdgeInsets.symmetric(
                                        horizontal: 20,
                                        vertical: 14,
                                      ),
                                    ),
                              ),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Text(
                              ' ${DateFormat('d-MMM-yyy').format(date)}',
                              style: Sty().mediumText.copyWith(
                                  color: Clr().black,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Title',
                              style: Sty().mediumText.copyWith(
                                  color: Clr().black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              width: 60,
                            ),
                            Expanded(
                              child: TextFormField(
                                controller: _titleCtrl,
                                onTapOutside: (event) {
                                  FocusScope.of(context).unfocus();
                                },
                                cursorColor: Clr().black,
                                style: Sty()
                                    .smallText
                                    .copyWith(color: Clr().black),
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.done,
                                obscureText: false,
                                decoration: Sty()
                                    .textFieldOutlineStyle
                                    .copyWith(
                                      fillColor: Clr().white,
                                      filled: true,
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(width: 0.1),
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: BorderSide(
                                          color: _titleCtrl.text.isNotEmpty
                                              ? Clr().primaryColor
                                              : Clr().textSecondary,
                                        ),
                                      ),
                                      counterText: "",
                                      contentPadding: EdgeInsets.symmetric(
                                        horizontal: 20,
                                        vertical: 14,
                                      ),
                                    ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Description',
                          style: Sty().mediumText.copyWith(
                              color: Clr().black,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        TextFormField(
                          controller: _descriptionCtrl,
                          onTapOutside: (event) {
                            FocusScope.of(context).unfocus();
                          },
                          cursorColor: Clr().black,
                          style: Sty().smallText.copyWith(color: Clr().black),
                          maxLines: 5,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.done,
                          obscureText: false,
                          decoration: Sty().textFieldOutlineStyle.copyWith(
                                fillColor: Clr().hintColor,
                                filled: true,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(width: 0.1),
                                    borderRadius: BorderRadius.circular(12)),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(
                                    color: _descriptionCtrl.text.isNotEmpty
                                        ? Clr().primaryColor
                                        : Clr().textSecondary,
                                  ),
                                ),
                                counterText: "",
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 14,
                                ),
                              ),
                        ),
                        BlocBuilder<EventsBloc, EventsState>(
                          builder: (context, state) {
                            if (state is EventsLoading) {
                              return Container();
                            } else if (state is EventsLoaded) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 32,
                                  ),
                                  Text(
                                    'List Of events added till date',
                                    style: Sty().mediumText.copyWith(
                                        color: Clr().black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: state.expenses.length,
                                    itemBuilder: (context, index) {
                                      final expense = state.expenses[index];
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0, vertical: 8.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(18),
                                              border: Border.all(
                                                  color: Colors.black12)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(12.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Wrap(
                                                      children: [
                                                        Text(
                                                          DateFormat(
                                                                  'd-MMM-yyy')
                                                              .format(
                                                                  expense.date),
                                                          style: const TextStyle(
                                                              color: Color(
                                                                  0xff00274e),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontSize: 16),
                                                        ),
                                                        // Text(
                                                        //   '${"expense.title"}',
                                                        //   style: const TextStyle(
                                                        //       color: Color(
                                                        //           0xff00274e),
                                                        //       fontWeight:
                                                        //           FontWeight.w600,
                                                        //       fontSize: 16),
                                                        // ),
                                                      ],
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        print(
                                                            "ID :: ${expense.id}");
                                                        context
                                                            .read<EventsBloc>()
                                                            .add(DeleteExpense(
                                                                expense.id!));
                                                      },
                                                      child: Icon(Icons.delete,
                                                          color: Colors.red,
                                                          size: 18),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 12,
                                                ),
                                                Text(
                                                  expense.title.toString(),
                                                  style: const TextStyle(
                                                      color: Color(0xff00274e),
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 16),
                                                ),
                                                Text(
                                                  expense.description
                                                      .toString(),
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      color:
                                                          Clr().textSecondary,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 14),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              );
                            } else {
                              return Container();
                            }
                            ;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: () {
                      final description = _descriptionCtrl.text;
                      final title = _titleCtrl.text;
                      final date = DateTime.now();
                      final expense = EventDetails(
                          description: description, title: title, date: date);

                      if (_titleCtrl.text.isNotEmpty) {
                        context.read<EventsBloc>().add(AddExpense(expense));
                        Fluttertoast.showToast(
                          msg: "Event Successfully added",
                          toastLength: Toast.LENGTH_SHORT,
                        );
                        print("Expense :: $expense");
                      } else {
                        Fluttertoast.showToast(
                          msg: "Please enter event title",
                          toastLength: Toast.LENGTH_SHORT,
                        );
                      }
                      if (_titleCtrl.text.isNotEmpty &&
                          _descriptionCtrl.text.isNotEmpty) {
                        _titleCtrl.clear();
                        _descriptionCtrl.clear();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Clr().black,
                      backgroundColor: Clr().primaryColor,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Clr().primaryColor,
                          ),
                          borderRadius: BorderRadius.circular(0)),
                    ),
                    child: Text(
                      'Save',
                      style: Sty().mediumText.copyWith(color: Clr().white),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
