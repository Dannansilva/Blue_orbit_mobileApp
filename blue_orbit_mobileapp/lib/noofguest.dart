// ignore_for_file: avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:blue_orbit_mobileapp/Components/Bottom_navbar.dart';
import 'package:flutter/material.dart';

class noguest extends StatefulWidget {
  const noguest({Key? key}) : super(key: key);

  @override
  State<noguest> createState() => _noguestState();
}

class _noguestState extends State<noguest> {
  int selectedGuest = 2; // Start from 2

  @override
  Widget build(BuildContext context) {
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
                Navigator.pushNamed(context, "/reserv");
              },
              icon: const Icon(Icons.arrow_back_outlined),
            ),
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            end: Alignment.topRight,
            colors: [Color(0xffABB0FF), Color(0xFFFFE9AF)],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 25.0, right: 25, bottom: 25),
                  child: Text(
                    "SELECT THE NUMBER OF GUESTS",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      decoration: TextDecoration.none,
                      foreground: Paint()
                        ..strokeWidth = 2
                        ..color = Colors.black
                        ..style = PaintingStyle.stroke,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                //boxes'
                Expanded(
                  child: ListView.builder(
                    itemCount: 3, // 3 rows
                    itemBuilder: (context, row) {
                      if (row == 0) {
                        // First row with two boxes each
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            buildBox(2),
                            buildBox(4),
                          ],
                        );
                      } else if (row == 1) {
                        // Middle row with single box
                        return Center(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedGuest = 6;
                              });
                              printSelectedGuest();
                            },
                            child: Container(
                              width: 120, // Adjusted size
                              height: 120, // Adjusted size
                              margin: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: selectedGuest == 6
                                    ? Color(0xffDAA420)
                                    : Colors.white,
                              ),
                              child: Center(
                                child: Text(
                                  "6",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w900,
                                    color: selectedGuest == 6
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      } else {
                        // Third row with two boxes each
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            buildBox(8),
                            buildBox(10),
                          ],
                        );
                      }
                    },
                  ),
                ),
                Row(
                  children: [
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right: 25.0, bottom: 25),
                      child:
                          ElevatedButton(onPressed: () {}, child: Text("Next")),
                    )
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
          ),
        ),
      ),
    );
  }

  Widget buildBox(int number) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedGuest = number;
        });
        printSelectedGuest();
      },
      child: Container(
        width: 120, // Adjusted size
        height: 120, // Adjusted size
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: selectedGuest == number ? Color(0xffDAA420) : Colors.white,
        ),
        child: Center(
          child: Text(
            "$number",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w900,
              color: selectedGuest == number ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  void printSelectedGuest() {
    print('Selected Guest: $selectedGuest');
  }
}
