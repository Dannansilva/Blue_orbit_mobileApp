// ignore_for_file: prefer_const_constructors, avoid_print, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:blue_orbit_mobileapp/Components/Bottom_navbar.dart';
import 'package:flutter/material.dart';

class tableNO extends StatefulWidget {
  const tableNO({Key? key}) : super(key: key);

  @override
  State<tableNO> createState() => _tableNOState();
}

class _tableNOState extends State<tableNO> {
  List<String> selectedBoxes = []; // Track selected boxes

  @override
  Widget build(BuildContext context) {
    List<String> customTexts = [
      'w1',
      'w2',
      'w3',
      'R3',
      'R6',
      'R10',
      'R11',
      'R15'
    ]; // Custom texts for each box

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
                Text(
                  "SELECT YOUR TABLE ",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    decoration: TextDecoration.none,
                    foreground: Paint()
                      ..strokeWidth = 1
                      ..color = Colors.black
                      ..style = PaintingStyle.stroke,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                //boxes
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (int i = 0; i < 3; i++) buildBox(customTexts[i]),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (int i = 3; i < customTexts.length; i++)
                          buildBox(customTexts[i]),
                      ],
                    ),
                  ],
                ),
                Spacer(),
                //book more tabels
                TextButton(
                    onPressed: () {},
                    child: Text("To book more seats click here.")),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "*W - Window Seats (does not rotate)",
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          "*R - Rotating Seats",
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 25.0, right: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/reservsum');
                          },
                          child: Text(
                            "Reserve",
                            style: TextStyle(
                                color: Color(0xff140A4D),
                                fontWeight: FontWeight.bold),
                          ))
                    ],
                  ),
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

  Widget buildBox(String text) {
    final isSelected = selectedBoxes.contains(text);

    return GestureDetector(
      onTap: () {
        setState(() {
          if (isSelected) {
            selectedBoxes.remove(text); // Deselect if already selected
          } else {
            selectedBoxes.add(text); // Select if not selected
          }
        });
        print('Selected Boxes: $selectedBoxes');
      },
      child: Container(
        width: 60,
        height: 60,
        margin: EdgeInsets.all(5),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? Color(0xffDAA420) : Colors.grey,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(text,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
      ),
    );
  }
}
