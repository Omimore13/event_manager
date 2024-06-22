import 'package:double_back_to_close/double_back_to_close.dart';
import 'package:event_manager/bloc/events_bloc.dart';
import 'package:event_manager/bloc/events_state.dart';
import 'package:event_manager/static_methods/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'create_event_screen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedYear = DateTime.now().year;
  int selectedMonth = DateTime.now().month;

  @override
  Widget build(BuildContext context) {
    return DoubleBack(
      message: "Tap back again to exit Event Manager app",
      child: Scaffold(
        backgroundColor: Clr().white,
        appBar: AppBar(
          title: Text(
            'Events',
            style: Sty().largeText.copyWith(
                color: Clr().white, fontSize: 22, fontWeight: FontWeight.w800),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Clr().primaryColor,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          _selectYear(context);
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Clr().black,
                          backgroundColor: Clr().primaryColor,
                          shape: RoundedRectangleBorder(
                              side: BorderSide(
                                color: Clr().primaryColor,
                              ),
                              borderRadius: BorderRadius.circular(12)),
                        ),
                        child: Text(
                          '$selectedYear',
                          style: Sty().mediumText.copyWith(color: Clr().white),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          _selectMonth(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Clr().primaryColor,
                          foregroundColor: Clr().black,
                          shape: RoundedRectangleBorder(
                              side: BorderSide(
                                color: Clr().primaryColor,
                              ),
                              borderRadius: BorderRadius.circular(12)),
                        ),
                        child: Text(
                          DateFormat.MMMM().format(DateTime(0, selectedMonth)),
                          style: Sty().mediumText.copyWith(color: Clr().white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(child: _eventsListLayout(context)),
            ],
          ),
        ),
      ),
    );
  }


  ///Events List Layout Code
  Widget _eventsListLayout(ctx) {
    final daysInMonth = DateTime(selectedYear, selectedMonth + 1, 0).day;
    return BlocBuilder<EventsBloc, EventsState>(
      builder: (context, state) {
        if (state is EventsLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is EventsLoaded) {
          return ListView.separated(
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 20,
                child: Divider(
                  color: Clr().textSecondary.withOpacity(0.5),
                  thickness: 0.3,
                ),
              );
            },
            itemCount: daysInMonth,
            itemBuilder: (context, index) {
              final date = DateTime(selectedYear, selectedMonth, index + 1);

              return InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => CreateEventScreen(date: date),
                    ),
                  );
                  print("Date :: ${DateFormat('d-MMM-yyy').format(date)}");
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          DateFormat('d ').format(date),
                          style: Sty()
                              .largeText
                              .copyWith(color: Clr().black, fontSize: 20),
                        ),
                        Text(
                          DateFormat('MMM').format(date),
                          style: Sty()
                              .largeText
                              .copyWith(color: Clr().black, fontSize: 20),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 32,
                    ),
                    Container(
                      height: 40,
                      width: 2,
                      decoration: BoxDecoration(color: Clr().textSecondary),
                    ),
                    // Expanded(
                    //   child: BlocBuilder<EventsBloc, EventsState>(
                    //     builder: (context, state) {
                    //       if (state is EventsLoading) {
                    //         return Center(child: CircularProgressIndicator());
                    //       } else if (state is EventsLoaded) {
                    //         final expense = state.expenses.length;
                    //         print("Expense :: ${expense.title}");
                    //         return Column(
                    //           children: [
                    //             // Text("14:00"),
                    //             Text(expense.title.toString()),
                    //           ],
                    //         );
                    //       } else {
                    //         return Container();
                    //       }
                    //     },
                    //   ),
                    //   // child:  Text(expense.title.toString()),
                    // ),
                  ],
                ),
              );
              // subtitle: event != null ? Text(event.title) : null,
            },
          );
        } else {
          return Container();
        }

        //
        // return Center(child: CircularProgressIndicator());
      },
    );
  }

  ///Bottomsheet to select year
  void _selectYear(BuildContext context) async {
    final int? picked = await showModalBottomSheet<int>(
      isScrollControlled: true,
      useSafeArea: true,
      context: context,
      builder: (BuildContext context) {
        return InkWell(
          onTap: () => (DateTime dateTime) {
            Navigator.pop(context, dateTime.year);
          },
          child: Container(
            height: MediaQuery.of(context).size.height / 1.35,
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(18),
                      topRight: Radius.circular(18),
                    ),
                    color: Color(0xffc6e1f8),
                    // border: Border.all(color: Clr().borderColor)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8.0,
                    ),
                    child: Center(
                      child: Text(
                        "Year",
                        style: Sty()
                            .mediumText
                            .copyWith(color: Clr().textSecondary),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 20,
                        child: Divider(
                          color: Clr().textSecondary.withOpacity(0.5),
                          thickness: 0.5,
                        ),
                      );
                    },
                    itemCount: 10,
                    physics: const AlwaysScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final year = 2016 + index;
                      return InkWell(
                        onTap: () {
                          Navigator.pop(context, year);
                        },
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20.0),
                            child: Text(
                              '$year',
                              style: Sty().largeText.copyWith(
                                  color: Clr().primaryLightColor, fontSize: 20),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
    if (picked != null && picked != selectedYear) {
      setState(() {
        selectedYear = picked;
      });
    }
  }

  ///Bottomsheet to select Month
  void _selectMonth(BuildContext context) async {
    final picked = await showModalBottomSheet(
      isScrollControlled: true,
      useSafeArea: true,
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height / 1.35,
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(18),
                    topRight: Radius.circular(18),
                  ),
                  color: Color(0xffc6e1f8),
                  // border: Border.all(color: Clr().borderColor)
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: Center(
                    child: Text(
                      "Month",
                      style:
                          Sty().mediumText.copyWith(color: Clr().textSecondary),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 20,
                      child: Divider(
                        color: Clr().textSecondary.withOpacity(0.5),
                        thickness: 0.5,
                      ),
                    );
                  },
                  itemCount: 12,
                  physics: const AlwaysScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.pop(context, index + 1);
                      },
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20.0),
                          child: Text(
                            DateFormat.MMMM().format(DateTime(0, index + 1)),
                            style: Sty().largeText.copyWith(
                                color: Clr().primaryLightColor, fontSize: 20),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
    if (picked != null && picked != selectedMonth) {
      setState(() {
        selectedMonth = picked;
      });
    }
  }
}
