// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SpecialOffer extends StatefulWidget {
  const SpecialOffer({Key? key}) : super(key: key);

  @override
  State<SpecialOffer> createState() => _SpecialOfferState();
}

class _SpecialOfferState extends State<SpecialOffer> {
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
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: Column(
                children: [
                  // Text(
                  //   "Special Offers",
                  //   style: TextStyle(
                  //     fontWeight: FontWeight.bold,
                  //     fontSize: 30,
                  //     decoration: TextDecoration.none,
                  //     foreground: Paint()
                  //       ..strokeWidth = 1.5
                  //       ..color = Colors.black
                  //       ..style = PaintingStyle.stroke,
                  //   ),
                  // ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Text(
                            "Special Offers",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              decoration: TextDecoration.none,
                              foreground: Paint()
                                ..strokeWidth = 1.5
                                ..color = Colors.black
                                ..style = PaintingStyle.stroke,
                            ),
                          ),
                          SpecialOfferCard(
                            image: 'assets/offer1.png',
                            title: 'Extraordinary Christmas',
                            description:
                                'Restaurant Description Restaurant Description ',
                          ),
                          SpecialOfferCard(
                            image: 'assets/offer2.png',
                            title: '25% off Savings Offer!',
                            description:
                                'Restaurant Description Restaurant Description',
                          ),
                          // Add more SpecialOfferCard widgets for additional offers
                          SpecialOfferCard(
                            image: 'assets/offer1.png',
                            title: 'Offer 1',
                            description: 'Description for Offer 1',
                          ),
                          SpecialOfferCard(
                            image: 'assets/offer2.png',
                            title: 'Offer 2',
                            description: 'Description for Offer 2',
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SpecialOfferCard extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const SpecialOfferCard({
    required this.image,
    required this.title,
    required this.description,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15),
      child: Card(
        margin: const EdgeInsets.all(20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              child: Image.asset(
                image,
                fit: BoxFit.cover,
                // height: 200,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    description,
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
