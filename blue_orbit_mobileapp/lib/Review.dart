// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/material.dart';

class ReviewPage extends StatefulWidget {
  const ReviewPage({super.key});

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
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
                Text(
                  "REIVEW",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    decoration: TextDecoration.none,
                    foreground: Paint()
                      ..strokeWidth = 1
                      ..color = Colors.black
                      ..style = PaintingStyle.stroke,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
