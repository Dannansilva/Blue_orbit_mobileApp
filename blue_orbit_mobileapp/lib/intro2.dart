// ignore_for_file: prefer_const_constructors, camel_case_types, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class intro2 extends StatelessWidget {
  const intro2({super.key});

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
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(children: [
              Column(
                children: [
                  //image
                  Padding(
                    padding: const EdgeInsets.only(top: 45.0, bottom: 20),
                    child: Image(
                      image: AssetImage('assets/intro2.png'),
                    ),
                  ),

                  //text
                  Padding(
                    padding: const EdgeInsets.only(left: 35.0, right: 25),
                    child: Center(
                      child: Text(
                        "An extraordinary venue - Blue Orbit, Sri Lanka's only revolving restaurant where you can savour delectable cuisine as you take in a breathtaking 360° view of Colombo.",
                        textAlign: TextAlign.center, // Center align the text
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          height: 1.1,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              // skip button
              SizedBox(
                height: 45,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/intro');
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Color(0xff140A4D)),
                      minimumSize:
                          MaterialStateProperty.all<Size>(Size(90, 50)),
                    ),
                    child: Text(
                      "Skip",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                  SizedBox(width: 10),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
