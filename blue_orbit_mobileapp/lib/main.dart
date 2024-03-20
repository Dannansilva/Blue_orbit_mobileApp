// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:blue_orbit_mobileapp/intro.dart';
import 'package:blue_orbit_mobileapp/intro2.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: intro(),
      routes: {
        '/intro': (context) => const intro(),
        '/intro2': (context) => const intro2(),
      },
    );
  }
}
