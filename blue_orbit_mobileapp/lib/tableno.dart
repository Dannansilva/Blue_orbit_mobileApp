// ignore_for_file: prefer_const_constructors, avoid_print, camel_case_types, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class tableNO extends StatefulWidget {
  const tableNO({Key? key}) : super(key: key);

  @override
  State<tableNO> createState() => _tableNOState();
}

class _tableNOState extends State<tableNO> {
  String? selectedBox;

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
                  padding: const EdgeInsets.only(left: 25.0),
                  child: Column(
                    children: [
                      Text(
                          "*W - Window Seats (does not rotate)*R - Rotating Seats")
                    ],
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
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedBox = text;
        });
        print('Selected Box: $selectedBox');
      },
      child: Container(
        width: 60,
        height: 60,
        margin: EdgeInsets.all(5),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: selectedBox == text ? Color(0xffDAA420) : Colors.grey,
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
