// ignore_for_file: avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:blue_orbit_mobileapp/Components/Bottom_navbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // Sample card data
    List<Map<String, dynamic>> cardData = [
      {
        'image': 'assets/homecardone.png',
        'title': 'Card Title 1',
        'description': 'Description for Card 1',
      },
      {
        'image': 'assets/homecardthree.png',
        'title': 'Card Title 2',
        'description': 'Description for Card 2',
      },
      {
        'image': 'assets/homecardtwo.png',
        'title': 'Card Title 3',
        'description': 'Description for Card 3',
      },
    ];

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomRight,
                end: Alignment.topRight,
                colors: [Color(0xffABB0FF), Color(0xFFFFE9AF)],
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).padding.top +
                  260, // To cover status bar
              color: Color(0xffDAA420), // Blue color for the top of the screen
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      Image.asset('assets/logo.png'),
                      Spacer(),
                      CircleAvatar(
                        radius: 35,
                        backgroundImage: AssetImage('assets/person2.png'),
                      ),
                    ],
                  ),
                ),
                // Search bar
                Padding(
                  padding: const EdgeInsets.only(left: 40, right: 40, top: 15),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Icon(
                            Icons.search,
                            size: 35,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "search...",
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xffDAA420),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Icon(
                              Icons.filter_list,
                              color: Colors.white,
                              size: 35,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                // Image overlay
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Container(
                      height: screenWidth / 3,
                      width: screenWidth / 1.5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        image: DecorationImage(
                          image: AssetImage('assets/offer2.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                // Scrollable list
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 25.0),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, right: 25),
                      child: Row(
                        children: [
                          // first one
                          Container(
                            height: 35,
                            width: screenWidth / 3,
                            decoration: BoxDecoration(
                              color: Color(0xff06294F),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                "More Offers",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                            ),
                          ),
                          SizedBox(width: 15),
                          // second one
                          Container(
                            height: 35,
                            width: screenWidth / 3,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text("Cuisines"),
                            ),
                          ),
                          SizedBox(width: 15),
                          // third one
                          Container(
                            height: 35,
                            width: screenWidth / 3,
                            decoration: BoxDecoration(
                              color: Color(0xff06294F),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                "About us",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                            ),
                          ),
                          SizedBox(width: 15),
                          // fourth one
                          Container(
                            height: 35,
                            width: screenWidth / 3,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text("Review"),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // Cards
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8, top: 8),
                    child: SizedBox(
                      height: screenHeight / 2.1,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: cardData.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              child: Container(
                                height: 220,
                                width: 220,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: AssetImage(cardData[index]['image']),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        cardData[index]['title'],
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        cardData[index]['description'],
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Bottom Navigation Bar
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              // Set the background color here
              child: BottomNavBar(
                icons: [
                  Icons.menu,
                  Icons.local_offer,
                  Icons.book_online,
                  Icons.person,
                ],
                onPressed: [
                  () => Navigator.pushNamed(context, '/intro'),
                  () => Navigator.pushNamed(context, '/offer'),
                  () => Navigator.pushNamed(context, '/reserv'),
                  () => Navigator.pushNamed(context, '/profile'),
                ],
                currentIndex: 0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
