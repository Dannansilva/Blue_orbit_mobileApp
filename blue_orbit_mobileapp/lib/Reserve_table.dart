// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, camel_case_types

import 'package:flutter/material.dart';

class reservetable extends StatefulWidget {
  const reservetable({super.key});

  @override
  State<reservetable> createState() => _reservetableState();
}

class _reservetableState extends State<reservetable> {
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
                  padding: const EdgeInsets.only(top: 25.0),
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
                //date picker
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(Icons.calendar_today),
                          Text("Select Date"),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
