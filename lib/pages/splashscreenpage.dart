import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gif_view/gif_view.dart';
import 'package:ilpverifyapp/pages/authhandler.dart';

class GifSplashScreen extends StatefulWidget {
  const GifSplashScreen({super.key});

  @override
  _GifSplashScreenState createState() => _GifSplashScreenState();
}

class _GifSplashScreenState extends State<GifSplashScreen> {
  @override
  void initState() {
    super.initState();

// Adjust frames
    Future.delayed(const Duration(seconds: 2), () {
      Get.off(() => const AuthhandlerPage()); // Navigate to the home screen
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff4fff5),
      body: Center(
          child: GifView.asset(
        repeat: ImageRepeat.noRepeat,
        'assets/images/splashscreen.gif',
        height: 150,
        width: 200,
      )),
    );
  }
}
