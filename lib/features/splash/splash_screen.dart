import 'dart:async';

import 'package:flutter/material.dart';
import 'package:news_app/features/nav_bar/nav_bar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => NavBar()),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff001F3F),
      body: Padding(
        padding: const EdgeInsets.only(right: 60),
        child: Center(child: Image.asset("assets/Group 24.png")),
      ),
    );
  }
}
