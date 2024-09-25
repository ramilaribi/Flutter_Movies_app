import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '/widgets/bottom_nav_bar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 4), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const BottomNavBar(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SizedBox(
          width: screenWidth * 0.7,
          height: screenHeight * 0.5,
          child: Lottie.asset(
            "assets/splachscreen.json",
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
