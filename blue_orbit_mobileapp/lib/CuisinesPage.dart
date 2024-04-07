// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:blue_orbit_mobileapp/Components/Bottom_navbar.dart';
import 'package:flutter/material.dart';

class cuisinesPage extends StatelessWidget {
  const cuisinesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      
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
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildCuisineBox(
                        context,
                        image: 'assets/SriLankanCP.png',
                        cuisineName: 'Sri Lankan',
                        onPressed: () {
                          // Navigate to Sri Lankan cuisine details
                          Navigator.pushNamed(context, '/SriLankanFD');
                        },
                      ),
                      _buildCuisineBox(
                        context,
                        image: 'assets/ItalianCP.png',
                        cuisineName: 'Italian',
                        onPressed: () {
                          // Navigate to Italian cuisine details
                          Navigator.pushNamed(context, '/ItalianFD');
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildCuisineBox(
                        context,
                        image: 'assets/JapaneseCP.png',
                        cuisineName: 'Japanese',
                        onPressed: () {
                          // Navigate to Japanese cuisine details
                          Navigator.pushNamed(context, '/JapaneseFD');
                        },
                      ),
                      _buildCuisineBox(
                        context,
                        image: 'assets/ArabianCP.png',
                        cuisineName: 'Arabian',
                        onPressed: () {
                          // Navigate to Arabian cuisine details
                          Navigator.pushNamed(context, '/ArabianFD');
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildCuisineBox(
                        context,
                        image: 'assets/ChineseCP.png',
                        cuisineName: 'Chinese',
                        onPressed: () {
                          // Navigate to Chinese cuisine details
                          Navigator.pushNamed(context, '/ChineseFD');
                        },
                      ),
                      _buildCuisineBox(
                        context,
                        image: 'assets/IndianCP.png',
                        cuisineName: 'Indian',
                        onPressed: () {
                          // Navigate to Indian cuisine details
                          Navigator.pushNamed(context, '/IndianFD');
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      // Navbar
      bottomNavigationBar: BottomNavBar(
        icons: [
          Icons.menu,
          Icons.local_offer,
          Icons.book_online,
          Icons.info,
        ],
        onPressed: [
          () => Navigator.pushNamed(context, '/intro'),
          () => Navigator.pushNamed(context, '/offer'),
          () => Navigator.pushNamed(context, '/reserv'),
          () => Navigator.pushNamed(context, '/guest'),
        ],
        currentIndex: 0,
      ),
    );
  }

  Widget _buildCuisineBox(BuildContext context,
      {required String image,
      required String cuisineName,
      required VoidCallback onPressed}) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 150,
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Text(
            cuisineName,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: [
                Shadow(
                  offset: Offset(1, 1),
                  blurRadius: 3,
                  color: Colors.black.withOpacity(0.5),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
