// ignore_for_file: prefer_const_constructors, unused_import

import 'dart:ffi';
import 'dart:ui';

import 'package:blue_orbit_mobileapp/ArabianFD.dart';
import 'package:blue_orbit_mobileapp/ChineseFD.dart';
import 'package:blue_orbit_mobileapp/IndianFD.dart';
import 'package:blue_orbit_mobileapp/ItalianFD.dart';
import 'package:blue_orbit_mobileapp/JapaneseFD.dart';
import 'package:blue_orbit_mobileapp/Login.dart';
import 'package:blue_orbit_mobileapp/Special_offers.dart';
import 'package:blue_orbit_mobileapp/SrilankanFD.dart';
import 'package:blue_orbit_mobileapp/guest.dart';
import 'package:blue_orbit_mobileapp/intro.dart';
import 'package:blue_orbit_mobileapp/intro2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: GoogleFonts.montserrat().fontFamily,
      ),
      debugShowCheckedModeBanner: false,
      home: indianFD(),
      routes: {
        '/intro': (context) => const intro(),
        '/intro2': (context) => const intro2(),
        '/guest': (context) => const Guest(),
        '/offer': (context) => const SpecialOffer(),
        '/srilankan': (context) => const srilankanFD(),
        '/italian': (context) => const italianFD(),
        '/japanese': (context) => const japaneseFD(),
        '/arabian': (context) => const arabianFD(),
        '/chinese': (context) => const chineseFD(),
        '/indian': (context) => const indianFD(),
      },
    );
  }
}
