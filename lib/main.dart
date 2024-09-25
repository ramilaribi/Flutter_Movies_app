import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'controllers/movie_controller.dart';
import '/screens/splash_screen.dart';

void main() {
  Get.put(MovieController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Movie App',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        textTheme: TextTheme(
          bodyLarge: TextStyle(
            color: Colors.white,
            fontSize: _getResponsiveFontSize(context, 24),
          ),
          bodyMedium: TextStyle(
            color: Colors.white,
            fontSize: _getResponsiveFontSize(context, 20),
          ),
        ),
        fontFamily: GoogleFonts.ptSans().fontFamily,
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 0, 0, 0),
          background: Colors.black,
        ),
      ),
      home: const SplashScreen(),
    );
  }

  double _getResponsiveFontSize(BuildContext context, double baseSize) {
    double screenWidth = MediaQuery.of(context).size.width;
        if (screenWidth < 400) {
      return baseSize * 0.8; 
    } else if (screenWidth < 600) {
      return baseSize; 
    } else {
      return baseSize * 1.2; 
    }
  }
}
