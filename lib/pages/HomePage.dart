import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ilpverifyapp/controller/scancontroller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the HomeController
    Scancontroller controller = Get.put(Scancontroller());

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ILP Card Verification',
          style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 3),
        ),
        centerTitle: true,
      ),
      body: GetBuilder<Scancontroller>(builder: (_) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Title and Instructions
              const Text(
                'Verify Your Card',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8.0),
              Text(
                'Tap the button below to scan the QR code on the card and verify its authenticity.',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey[600],
                    fontStyle: FontStyle.italic),
              ),
              const SizedBox(height: 30.0),

              // Scan Button
              GestureDetector(
                onTap: controller.startQRScan,
                child: Card(
                  color: Colors.white,
                  elevation: 10,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'assets/images/scan.gif',
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30.0),

          
            ],
          ),
        );
      }),
    );
  }
}
