// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, camel_case_types, unused_import

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
                    gradient: LinearGradient(
                      begin: Alignment.bottomLeft, // Adjusted begin to bottomLeft
                      end: Alignment.topRight,
                      colors: [Color(0xffABB0FF), Color(0xFFFFE9AF)],
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(55),
                      topRight: Radius.circular(55),
                    ),
                  ),
                  child: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Extraordinary Christmas!',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w900,
                            ),
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
                
              ],
            ),
          ),
          // image
        ],
      ),
    );
  }
}