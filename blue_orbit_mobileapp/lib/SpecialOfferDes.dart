// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:blue_orbit_mobileapp/Components/Bottom_navbar.dart';
import 'package:flutter/material.dart';

class specialofferdesc extends StatefulWidget {
  const specialofferdesc({super.key});

  @override
  State<specialofferdesc> createState() => _specialofferdescState();
}

class _specialofferdescState extends State<specialofferdesc> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final yellowBoxHeight = screenHeight / 2;

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
                Navigator.pushNamed(context, '/arabian');
              },
              icon: const Icon(Icons.arrow_back_outlined),
            ),
          ),
        ),
      ),
      body: Stack(
  children: [
    // Background Image positioned above the AppBar
    Positioned(
      top: kToolbarHeight * -0.5, // Adjust this value as needed
      left: 0,
      right: 0,
      height: kToolbarHeight * 2, // Adjust this value as needed
      child: Image.asset(
        'assets/xmasdinner.jpg', 
        fit: BoxFit.fitWidth,
      ),
    ),
          
          //yellow box and bottom navigation bar
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Column(
              children: [
                Container(
                  height: yellowBoxHeight,
                  decoration: BoxDecoration(
                    color: Color(0xffDAA420),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(55),
                      topRight: Radius.circular(55),
                    ),
                  ),
                  child: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 35.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Chinese Cuisine",
                            style: TextStyle(
                                fontSize: 35,
                                decoration: TextDecoration.none,
                                foreground: Paint()
                                  ..strokeWidth = 2
                                  ..color = Colors.white
                                  ..style = PaintingStyle.stroke),
                          ),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Id afnon pellentesque posuere nec nunc et enim nibh. Id afnon pellentesqueLorem ipsum dolor sit amet, consectetur adipiscing elit",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // Bottom Navigation Bar
                Container(
                  color: Color(0xffDAA420), // Set the background color here
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
                      () => Navigator.pushNamed(context, '/intro2'),
                      () => Navigator.pushNamed(context, '/guest'),
                    ],
                    currentIndex: 0,
                  ),
                ),
              ],
            ),
          ),
          // image
        ],
      ),
    );
  }
}