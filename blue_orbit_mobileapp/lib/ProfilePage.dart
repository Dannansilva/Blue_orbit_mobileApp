// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, camel_case_types

import 'package:blue_orbit_mobileapp/Components/Bottom_navbar.dart';
import 'package:flutter/material.dart';

class profilePage extends StatefulWidget {
  const profilePage({Key? key}) : super(key: key);

  @override
  State<profilePage> createState() => _profilePageState();
}

class _profilePageState extends State<profilePage> {
  String userName = "John Doe"; // Initial user name
  String contactNumber = "1234567890"; // Initial contact number

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomRight,
              end: Alignment.topRight,
              colors: [Color(0xffABB0FF), Color(0xFFFFE9AF)],
            ),
          ),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    // Handle profile picture change
                  },
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 60,
                        backgroundImage: AssetImage('assets/profilepic.png'),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Icon(
                          Icons.edit,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                _buildInfoBox(
                  title: "Personal Info",
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
                      TextFormField(
                        initialValue: userName,
                        onChanged: (value) {
                          setState(() {
                            userName = value; // Update user name
                          });
                        },
                        decoration: InputDecoration(
                          hintText: "Enter new user name",
                        ),
                      ),
                      SizedBox(height: 10),
                      Text("Change Password"),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Enter current password",
                        ),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Enter new password",
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                _buildInfoBox(
                  title: "Contact Info",
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
                      TextFormField(
                        initialValue: contactNumber,
                        onChanged: (value) {
                          setState(() {
                            contactNumber = value; // Update contact number
                          });
                        },
                        decoration: InputDecoration(
                          hintText: "Enter new contact number",
                        ),
                      ),
                      SizedBox(height: 10),
                      Text("Email"),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Enter email",
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Handle edit profile logic
                      },
                      child: Text("Edit Profile"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Handle save changes logic
                      },
                      child: Text("Save Changes"),
                    ),
                  ],
                ),
                SizedBox(height: 100), // Placeholder for bottom navigation bar
              ],
            ),
          ),
        ),
      ),
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

  Widget _buildInfoBox({required String title, required Widget content}) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          content,
        ],
      ),
    );
  }
}
