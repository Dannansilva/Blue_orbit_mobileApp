// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, camel_case_types

import 'package:blue_orbit_mobileapp/Components/Bottom_navbar.dart';
import 'package:flutter/material.dart';

class aboutus extends StatelessWidget {
  const aboutus({super.key});

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
            child: Column(
              children: [
                Column(
                  children: [
                    //image
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 20),
                      child: Image(
                        image: AssetImage('assets/aboutus.png'),
                      ),
                    ),

                    //text
                    Padding(
                      padding: const EdgeInsets.only(left: 35.0, right: 30),
                      child: Center(
                        child: Text(
                          "An extraordinary venue - Blue Orbit, Sri Lanka's only revolving restaurant where you can savour delectable cuisine as you take in a breathtaking 360° view of Colombo.",
                          textAlign: TextAlign.center, // Center align the text
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
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
                Text(
                  "For more",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    height: 1.1,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: Row(
                    children: [
                      Text(
                        "information:",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "0765444111/ 076544333",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ],
                  ),
                ),
                Text(
                  "info@citruslt.com",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Row(
                    children: [
                      Spacer(),
                      Image.asset(
                        'assets/facebook.png',
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Image.asset('assets/instagram.png'),
                      Spacer(),
                    ],
                  ),
                ),
                Spacer(),
                // Bottom Navigation Bar
                Container(
                  child: BottomNavBar(
                    icons: [
                      Icons.menu,
                      Icons.local_offer,
                      Icons.book_online,
                      Icons.person,
                    ],
                    onPressed: [
                      () => Navigator.pushNamed(context, '/Homepage'),
                      () => Navigator.pushNamed(context, '/offer'),
                      () => Navigator.pushNamed(context, '/reserv'),
                      () => Navigator.pushNamed(context, '/profile'),
                    ],
                    currentIndex: -1,
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
