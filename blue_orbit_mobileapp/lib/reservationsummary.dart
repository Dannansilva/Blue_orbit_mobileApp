// ignore_for_file: camel_case_types, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_unnecessary_containers, unnecessary_string_interpolations

import 'package:blue_orbit_mobileapp/Components/Bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class reservsummary extends StatefulWidget {
  final String selectedDate;
  final String selectedTime;
  const reservsummary(
      {Key? key, required this.selectedDate, required this.selectedTime});

  @override
  State<reservsummary> createState() => _reservsummaryState();
}

class _reservsummaryState extends State<reservsummary> {
  late String selectedDate = '';
  late String selectedTime = '';

  @override
  void initState() {
    super.initState();
    fetchReservationData();
  }

  void fetchReservationData() async {
    try {
      final QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('reservations').get();

      if (querySnapshot.docs.isNotEmpty) {
        final DocumentSnapshot documentSnapshot = querySnapshot.docs.first;

        setState(() {
          // Convert Firestore Timestamps to DateTime objects
          selectedDate = (documentSnapshot['selectedDate'] as Timestamp)
              .toDate()
              .toString();

          selectedTime = documentSnapshot['selectedTime'].toString();
        });
      } else {
        print('No documents found in the "reservations" collection.');
      }
    } catch (e) {
      print('Error fetching reservation data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<String>? selectedTables =
        ModalRoute.of(context)?.settings.arguments as List<String>?;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.white,
            ),
            child: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, "/noguest");
              },
              icon: const Icon(Icons.arrow_back_outlined),
            ),
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            end: Alignment.topRight,
            colors: [Color(0xffABB0FF), Color(0xFFFFE9AF)],
          ),
        ),
        // Centering the container in the middle of the screen
        child: Column(
          children: [
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.6,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(35),
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: Image.asset(
                              'assets/resSum.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            child: Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(25.0),
                                    child: Center(
                                      child: Text(
                                        'RESERVATION SUMMARY',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 50.0),
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 40.0, right: 30),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Date : ",
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                            Spacer(),
                                            //selected date
                                            Text(
                                              "${DateFormat('yyyy-MM-dd').format(DateTime.parse(selectedDate))}",
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  //time row
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20.0),
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 40.0, right: 30),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Time : ",
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                            Spacer(),
                                            Text(
                                              "${selectedTime} ",
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  //guest row
                                  // Padding(
                                  //   padding: const EdgeInsets.only(top: 20.0),
                                  //   child: Center(
                                  //     child: Padding(
                                  //       padding: const EdgeInsets.only(
                                  //           left: 40.0, right: 30),
                                  //       child: Row(
                                  //         mainAxisAlignment:
                                  //             MainAxisAlignment.center,
                                  //         children: [
                                  //           Text(
                                  //             "Guests : ",
                                  //             style: TextStyle(
                                  //               fontSize: 16,
                                  //               fontWeight: FontWeight.bold,
                                  //               color: Colors.white,
                                  //             ),
                                  //           ),
                                  //           Spacer(),
                                  //           Text(
                                  //             "10 pax ",
                                  //             style: TextStyle(
                                  //               fontSize: 16,
                                  //               fontWeight: FontWeight.bold,
                                  //               color: Colors.white,
                                  //             ),
                                  //           )
                                  //         ],
                                  //       ),
                                  //     ),
                                  //   ),
                                  // ),
                                  //table number

                                  Padding(
                                    padding: const EdgeInsets.only(top: 20.0),
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 40.0, right: 30),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Table number : ",
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                            Spacer(),
                                            Text(
                                              selectedTables != null
                                                  ? selectedTables.join(", ")
                                                  : "No tables selected",
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 35.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("Confirm "),
                  ),
                )
              ],
            ),
            Spacer(),
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
      ),
    );
  }
}
