import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ilpverifyapp/controller/authcontroller.dart';
import 'package:ilpverifyapp/controller/scancontroller.dart';
import 'package:ilpverifyapp/pages/authhandler.dart';
import 'package:ilpverifyapp/pages/navbar.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();

  // Initialize LocationController
  Get.put(LoginController()); // Registers the controller as a singleton
  Get.put(Scancontroller()); // Registers the controller as a singleton
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        // Use a Google Font for the entire app
        textTheme: GoogleFonts.kulimParkTextTheme(),
        appBarTheme: const AppBarTheme(
          toolbarHeight: 80,
          color: Colors.green,
          foregroundColor: Colors.white
        ),
        elevatedButtonTheme:ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              minimumSize: const Size(
                                  100, 50), // Minimum size for the button
                            ),
        ) ,
        // Optionally customize specific text styles
        primaryTextTheme: GoogleFonts.montserratTextTheme(),
      ),
      debugShowCheckedModeBanner: false,
      home: const AuthhandlerPage(),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
