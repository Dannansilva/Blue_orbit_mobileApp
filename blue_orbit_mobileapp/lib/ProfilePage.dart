// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, camel_case_types

import 'package:blue_orbit_mobileapp/Components/Bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class profilePage extends StatefulWidget {
  const profilePage({Key? key}) : super(key: key);

  @override
  State<profilePage> createState() => _profilePageState();
}

class _profilePageState extends State<profilePage> {
  String userName = "Mary Anne"; // Initial user name
  String contactNumber = "1234567890"; // Initial contact number
  String email = "example@example.com"; // Initial email
  String password = "examplepassword"; // Initial password

  bool isEditing = false; // Flag to track if profile is being edited

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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  _changeProfilePicture();
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
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _buildInfoBox(
                        title: "Personal Info",
                        content: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildInfoField("Name", userName),
                            _buildInfoField("Contact Number", contactNumber),
                            _buildInfoField("Email", email),
                            _buildInfoField("Password", password),
                            if (isEditing)
                              _buildEditField("New User Name",
                                  initialValue: userName,
                                  onChanged: (value) => userName = value),
                            if (isEditing)
                              _buildEditField("New Password",
                                  initialValue: password,
                                  obscureText: true,
                                  onChanged: (value) => password = value),
                            if (isEditing)
                              _buildEditField("New Contact Number",
                                  initialValue: contactNumber,
                                  onChanged: (value) => contactNumber = value),
                            if (isEditing)
                              _buildEditField("New Email",
                                  initialValue: email,
                                  onChanged: (value) => email = value),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                isEditing = true;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xff140A4D),
                            ),
                            child: Text(
                              "Edit Profile",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: _saveChanges,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xff140A4D),
                            ),
                            child: Text(
                              "Save Changes",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
              // Add Visibility widget to handle BottomNavBar visibility
              Visibility(
                visible: MediaQuery.of(context).viewInsets.bottom == 0,
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
                  currentIndex: 3,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoBox({required String title, required Widget content}) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(5),
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

  Widget _buildInfoField(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(width: 10),
          Text(
            value,
            style: TextStyle(
              fontStyle: value.isNotEmpty ? FontStyle.normal : FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEditField(String label,
      {required String initialValue,
      required ValueChanged<String> onChanged,
      bool obscureText = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        initialValue: initialValue,
        onChanged: onChanged,
        decoration: InputDecoration(
          labelText: label,
          suffixIcon: obscureText
              ? IconButton(
                  icon: Icon(Icons.visibility),
                  onPressed: () {},
                )
              : null,
        ),
        obscureText: obscureText,
      ),
    );
  }

  void _changeProfilePicture() {
    // Logic to handle profile picture change
  }

  void _saveChanges() {
    // Logic to save changes to the backend
    setState(() {
      isEditing = false; // Exit editing mode after saving changes
    });
  }
}
