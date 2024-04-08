// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:blue_orbit_mobileapp/Components/Bottom_navbar.dart';
import 'package:flutter/material.dart';

class ReviewPage extends StatefulWidget {
  const ReviewPage({Key? key}) : super(key: key);

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  // Sample review data
  List<Map<String, dynamic>> reviews = [
    {
      'userImage': 'assets/profilepic.png',
      'userName': 'John ',
      'stars': 4,
      'reviewText': 'Great product! Really satisfied with my purchase.',
    },
    {
      'userImage': 'assets/prson2.png',
      'userName': 'Jane ',
      'stars': 5,
      'reviewText': 'Amazing experience! Highly recommended.',
    },
    {
      'userImage': 'assets/profilepic.png',
      'userName': 'John ',
      'stars': 4,
      'reviewText': 'Great product! Really satisfied with my purchase.',
    },
    // Add more reviews as needed
  ];

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: Text(
                    "REVIEWS",
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
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: reviews.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  backgroundImage: AssetImage(
                                    reviews[index]['userImage'],
                                  ),
                                  radius: 25,
                                ),
                                SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        reviews[index]['userName'],
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Row(
                                        children: List.generate(
                                          reviews[index]['stars'],
                                          (index) => Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                            size: 20,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        reviews[index]['reviewText'],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              //add more reviews
              Padding(
                padding: const EdgeInsets.only(right: 25.0, bottom: 15),
                child: Row(
                  children: [
                    Spacer(),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.add,
                            size: 25,
                          )),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              //navbar
              Container(
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
                  currentIndex: 2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
