// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:blue_orbit_mobileapp/Components/My_textfeild.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController pass = TextEditingController();
  final TextEditingController conpass = TextEditingController();
  final TextEditingController contact = TextEditingController();

  Future<void> register() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: email.text.trim(), password: pass.text.trim());
      String userId = userCredential.user!.uid;
      await FirebaseFirestore.instance.collection("users").doc(userId).set({
        'name': name.text,
        'email': email.text,
        'contact': contact.text,
      });
      if (mounted) {
        Navigator.pushNamed(context, '/login');
      }
    } catch (e) {
      print("Error:${e.toString()}");
      return;
    }
  }

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
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Ayubowan,",
                      style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.w900,
                          foreground: Paint()
                            ..strokeWidth = 2
                            ..color = Color(0xffDAA420)
                            ..style = PaintingStyle.stroke),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Sign up to have the best dining experience!",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                          foreground: Paint()
                            ..strokeWidth = 1
                            ..color = Colors.black
                            ..style = PaintingStyle.stroke),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    MyTextField(
                        hintText: "Name", obscureText: false, controller: name),
                    SizedBox(height: 20),
                    MyTextField(
                        hintText: "Email",
                        obscureText: false,
                        controller: email),
                    SizedBox(height: 20),
                    MyTextField(
                        hintText: "Password",
                        obscureText: true,
                        controller: pass),
                    SizedBox(height: 20),
                    MyTextField(
                        hintText: "Confirm Password",
                        obscureText: true,
                        controller: conpass),
                    SizedBox(height: 20),
                    MyTextField(
                        hintText: "Contact number",
                        obscureText: false,
                        controller: contact),
                    SizedBox(height: 80),
                    ElevatedButton(
                      onPressed: register,
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Color(0xff140A4D)),
                        minimumSize:
                            MaterialStateProperty.all<Size>(Size(300, 50)),
                      ),
                      child: Text(
                        "Register",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don’t have an account!"),
                        TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/login');
                            },
                            child: Text(
                              "Log in",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w900,
                                  decoration: TextDecoration.none,
                                  foreground: Paint()
                                    ..strokeWidth = 0.8
                                    ..color = Color(0xffDAA420)
                                    ..style = PaintingStyle.stroke),
                            ))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
