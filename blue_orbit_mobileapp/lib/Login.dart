import 'package:blue_orbit_mobileapp/Components/My_textfeild.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emai = TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            MyTextField(
                hintText: "email address",
                obscureText: false,
                controller: emai),
          ],
        ),
      ),
    );
  }
}
