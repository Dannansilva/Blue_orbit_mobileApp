// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, no_leading_underscores_for_local_identifiers, unused_element, use_build_context_synchronously, avoid_print

import 'package:blue_orbit_mobileapp/Components/My_textfeild.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emai = TextEditingController();
    TextEditingController pass = TextEditingController();
    Future<void> login() async {
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emai.text.trim(), password: pass.text.trim());
      } catch (e) {
        print(e);
        return;
      }
      if (mounted) {
        Navigator.pushNamed(context, '/Homepage');
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
                    "Log in to continue!",
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
                    height: 25,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 25.0),
                      child: Text(
                        "EMAIL",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  MyTextField(
                      hintText: "email address",
                      obscureText: false,
                      controller: emai),
                  SizedBox(
                    height: 25,
                  ),
                  //password text box
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 25.0),
                      child: Text(
                        "PASSWORD",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  MyTextField(
                      hintText: "password",
                      obscureText: true,
                      controller: pass),
                  Spacer(),
                  ElevatedButton(
                    onPressed: login,
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Color(0xff140A4D)),
                      minimumSize:
                          MaterialStateProperty.all<Size>(Size(300, 70)),
                    ),
                    child: Text(
                      "Log in ",
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
                            onPressed: () {
                              Navigator.pushNamed(context, '/signup');
                            },
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
  }
}
