// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, camel_case_types, sort_child_properties_last, avoid_unnecessary_containers, annotate_overrides

import 'package:blue_orbit_mobileapp/Components/Bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class reservetable extends StatefulWidget {
  const reservetable({super.key});

  @override
  State<reservetable> createState() => _reservetableState();
}

class _reservetableState extends State<reservetable> {
  // date time variable
  DateTime selectedDate = DateTime.now();
  late bool _isLunchSelected;
  //date picker
  void _showDatePicker() {
    showDatePicker(
            context: context,
            firstDate: DateTime(2020),
            lastDate: DateTime(2050))
        .then((value) => {
              setState(
                () {
                  selectedDate = value!;
                },
              )
            });
  }

  void initState() {
    super.initState();
    _isLunchSelected = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            end: Alignment.topRight,
            colors: [Color(0xffABB0FF), Color(0xFFFFE9AF)],
          ),
        ),
        child: Center(
          child: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 25.0, bottom: 20),
                  child: Text(
                    "Reserve your table",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w900,
                        // color: Color(0xffDAA420),
                        decoration: TextDecoration.none,
                        foreground: Paint()
                          ..strokeWidth = 1.5
                          ..color = Colors.black
                          ..style = PaintingStyle.stroke),
                  ),
                ),
                //pick date text
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, top: 35),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "PICK A DATE",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          decoration: TextDecoration.none,
                          foreground: Paint()
                            ..strokeWidth = 1.5
                            ..color = Colors.black
                            ..style = PaintingStyle.stroke),
                    ),
                  ),
                ),
                //date picker
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: _showDatePicker,
                              icon: Icon(Icons.date_range)),
                          Text(
                              '${DateFormat('yyyy-MM-dd').format(selectedDate)}'),
                        ],
                      ),
                    ),
                  ),
                ),
                Spacer(),
                Column(
                  children: [
                    Text(
                      "PICK A TIME",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          // color: Color(0xffDAA420),
                          decoration: TextDecoration.none,
                          foreground: Paint()
                            ..strokeWidth = 1.5
                            ..color = Colors.black
                            ..style = PaintingStyle.stroke),
                    ),
                    //togle bar
                    Padding(
                      padding: const EdgeInsets.only(bottom: 50.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0, right: 8, top: 5, bottom: 5),
                          child: ToggleButtons(
                            borderWidth: 0,
                            borderColor: Colors.transparent,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    bottomLeft: Radius.circular(20),
                                    topRight: Radius.circular(
                                        20), // Added for rounded border
                                    bottomRight: Radius.circular(
                                        20), // Added for rounded border
                                  ),
                                  color: _isLunchSelected
                                      ? Colors.black
                                      : Colors.transparent,
                                  border: Border.all(
                                    color: Colors.transparent,
                                  ),
                                ),
                                child: Text(
                                  "Lunch",
                                  style: TextStyle(
                                    color: _isLunchSelected
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                    topLeft: Radius.circular(
                                        20), // Added for rounded border
                                    bottomLeft: Radius.circular(
                                        20), // Added for rounded border
                                  ),
                                  color: !_isLunchSelected
                                      ? Colors.black
                                      : Colors.transparent,
                                  border: Border.all(
                                    color: Colors.transparent,
                                  ),
                                ),
                                child: Text(
                                  "Dinner",
                                  style: TextStyle(
                                    color: !_isLunchSelected
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                              ),
                            ],
                            isSelected: [_isLunchSelected, !_isLunchSelected],
                            onPressed: (index) {
                              setState(() {
                                _isLunchSelected = index == 0;
                              });
                            },
                          ),
                        ),
                      ),
                    ),

                    Row(
                      children: [
                        Spacer(),
                        Padding(
                          padding:
                              const EdgeInsets.only(right: 25.0, bottom: 25),
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/noguest');
                              },
                              child: Text(
                                "Next",
                                style: TextStyle(color: Color(0xff140A4D)),
                              )),
                        ),
                      ],
                    ),

                    //navbar
                    Container(
                      child: BottomNavBar(
                        icons: [
                          Icons.menu,
                          Icons.local_offer,
                          Icons.book_online,
                          Icons.info,
                        ],
                        onPressed: [
                          () => Navigator.pushNamed(context, '/intro'),
                          () => Navigator.pushNamed(context, '/offer'),
                          () => Navigator.pushNamed(context, '/reserv'),
                          () => Navigator.pushNamed(context, '/guest'),
                        ],
                        currentIndex: 2,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
