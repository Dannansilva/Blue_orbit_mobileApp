// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:blue_orbit_mobileapp/ArabianFD.dart';
import 'package:blue_orbit_mobileapp/ChineseFD.dart';
import 'package:blue_orbit_mobileapp/IndianFD.dart';
import 'package:blue_orbit_mobileapp/ItalianFD.dart';
import 'package:blue_orbit_mobileapp/JapaneseFD.dart';
import 'package:blue_orbit_mobileapp/Login.dart';
import 'package:blue_orbit_mobileapp/Reserve_table.dart';
import 'package:blue_orbit_mobileapp/Signup.dart';
import 'package:blue_orbit_mobileapp/Special_offers.dart';
import 'package:blue_orbit_mobileapp/SrilankanFD.dart';
import 'package:blue_orbit_mobileapp/firebase_options.dart';
import 'package:blue_orbit_mobileapp/guest.dart';
import 'package:blue_orbit_mobileapp/intro.dart';
import 'package:blue_orbit_mobileapp/intro2.dart';
import 'package:blue_orbit_mobileapp/noofguest.dart';
import 'package:blue_orbit_mobileapp/reservationsummary.dart';
import 'package:blue_orbit_mobileapp/tableno.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: GoogleFonts.montserrat().fontFamily,
      ),
      debugShowCheckedModeBanner: false,
      home: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data != null) {
              return Login();
            } else {
              return Login();
            }
          }),
      routes: generateRoutes(),
    );
  }

  Map<String, WidgetBuilder> generateRoutes() {
    // Define selectedCount dynamically here
    int selectedCount = 2;

    return {
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
      '/noguest': (context) => const noguest(),
      '/reserv': (context) => const reservetable(),
      '/signup': (context) => const signup(),
      '/login': (context) => const Login(),
      // '/tabelno': (context) => tableNO(
      //       selectedCount: selectedCount,
      //     ),
      '/reservsum': (context) => const reservsummary(
            selectedDate: '',
            selectedTime: '',
          ),
    };
  }
}
