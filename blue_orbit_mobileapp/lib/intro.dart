// ignore_for_file: camel_case_types, prefer_const_constructors

import 'package:flutter/material.dart';

class intro extends StatelessWidget {
  const intro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.center,
            end: Alignment.topRight,
            colors: [Color(0xffC3C6F6), Color(0xFFFAECC7)],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(children: const [
              Column(
                children: [
                  //image
                  Padding(
                    padding: EdgeInsets.only(top: 5.0),
                    child: Image(
                      image: AssetImage('assets/intro.png'),
                      width: 500,
                      height: 600,
                    ),
                  ),
                  //text
                  Padding(
                    padding: EdgeInsets.all(25.0),
                    child: Text(
                      "Rising towards Colombo’s skyline the Nelum Kuluna is an iconic landmark that reflects the spirit of a nation.",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                  ),
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}
