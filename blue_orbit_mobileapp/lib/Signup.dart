// ignore_for_file: prefer_const_constructors, use_build_context_synchronously, empty_catches, unused_element, avoid_print, camel_case_types

import 'package:blue_orbit_mobileapp/Components/My_textfeild.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  @override
  Widget build(BuildContext context) {
    TextEditingController name = TextEditingController();
    TextEditingController emai = TextEditingController();
    TextEditingController pass = TextEditingController();
    TextEditingController conpass = TextEditingController();
    TextEditingController contact = TextEditingController();

    Future<void> register() async {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: emai.text.trim(), password: pass.text.trim());
        String userId = userCredential.user!.uid;
        await FirebaseFirestore.instance.collection("users").doc(userId).set({
          'name': name.text.trim(),
          'email': emai.text.trim(),
          'contact': contact.text.trim(),
        });
        if (mounted) {
          Navigator.pushNamed(context, '/login');
        }
      } catch (e) {
        print("Error:${e.toString()}");
        return;
      }
    }

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
              padding: const EdgeInsets.only(top: 50.0),
              child: Column(
                children: [
                  Text(
                    "Ayubowan,",
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w900,
                        // color: Color(0xffDAA420),
                        decoration: TextDecoration.none,
                        foreground: Paint()
                          ..strokeWidth = 2
                          ..color = Color(0xffDAA420)
                          ..style = PaintingStyle.stroke),
                  ),
                  Text(
                    "Sign up to have the best dining experience!",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                        // color: Color(0xffDAA420),
                        decoration: TextDecoration.none,
                        foreground: Paint()
                          ..strokeWidth = 1
                          ..color = Colors.black
                          ..style = PaintingStyle.stroke),
                  ),
                  //email text box
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 25.0),
                      child: Text(
                        "Name",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  MyTextField(
                      hintText: "Name", obscureText: false, controller: name),
                  SizedBox(
                    height: 20,
                  ),
                  //password text box
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 25.0),
                      child: Text(
                        "Emali",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  MyTextField(
                      hintText: "Email", obscureText: false, controller: emai),
                  SizedBox(
                    height: 20,
                  ),
                  //password text box
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 25.0),
                      child: Text(
                        "Password",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  MyTextField(
                      hintText: "Password",
                      obscureText: true,
                      controller: pass),
                  SizedBox(
                    height: 25,
                  ),
                  // Confirm password text box
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 25.0),
                      child: Text(
                        "Confirm Password",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  MyTextField(
                      hintText: "Confirm Password",
                      obscureText: true,
                      controller: conpass),
                  SizedBox(
                    height: 25,
                  ),
                  //password text box
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 25.0),
                      child: Text(
                        "Contact number",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  MyTextField(
                      hintText: "Contact number",
                      obscureText: false,
                      controller: contact),

                  Spacer(),
                  ElevatedButton(
                    onPressed: register,
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Color(0xff140A4D)),
                      minimumSize:
                          MaterialStateProperty.all<Size>(Size(300, 70)),
                    ),
                    child: Text(
                      "Register ",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don’t have an account!"),
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              "Sign up",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w900,
                                  // color: Color(0xffDAA420),
                                  decoration: TextDecoration.none,
                                  foreground: Paint()
                                    ..strokeWidth = 0.8
                                    ..color = Color(0xffDAA420)
                                    ..style = PaintingStyle.stroke),
                            ))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
    ;
  }
}
