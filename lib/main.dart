import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app/views/edit_prima_screen/prima_trip_1to4_screen.dart';

import 'package:travel_app/views/start/on_boarding_screen.dart';

import 'views/edit_prima_screen/edit_prima_trip_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel App',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          //scaffoldBackgroundColor: const Color.fromRGBO(50, 50, 50, 0.8),
          fontFamily: GoogleFonts.roboto().fontFamily),
      home: const OnBoardingScreen(),
      // home: PrimaTrip1To4Screens(),
    );
  }
}
