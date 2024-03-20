// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class intro extends StatelessWidget {
  const intro({super.key});

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
                      image: AssetImage('assets/intro.png'),
                    ),
                  ),

                  //text
                  Padding(
                    padding: const EdgeInsets.only(left: 35.0, right: 30),
                    child: Center(
                      child: Text(
                        "Rising towards Colombo’s skyline the Nelum Kuluna is an iconic landmark that reflects the spirit of a nation.",
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
                height: 80,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/intro2');
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
