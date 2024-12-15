import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff4fff5),
      body: Center(
        child: Image.asset(
          'assets/images/loading2.gif',
          height: 120,
        ),
      ),
    );
  }
}

Future? showLoadingDialog({required BuildContext context}) {
  showDialog(
    useSafeArea: true,
    context: context,
    barrierDismissible: false, // Prevents dialog from being dismissed
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Lottie.asset(
                'assets/images/loading.json',
                height: 100,
              ),
              const Text(
                'Please wait...',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
    },
  );
  return null;
}
