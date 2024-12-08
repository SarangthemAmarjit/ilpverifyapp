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
      body: Padding(
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

            // Scanned Data Display
            Obx(() {
              if (controller.scannedModel.value != null) {
                final model = controller.scannedModel.value!;
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 8.0),
                  elevation: 4.0,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Scanned Data:',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Divider(),
                        Text("Permit Type: ${model.permitType}"),
                        Text("Permit No: ${model.permitNo}"),
                        Text("Applicant Name: ${model.applicantName}"),
                        Text("Applicant Parent: ${model.applicantParent}"),
                        Text("ID No: ${model.idNo}"),
                        Text("Date of Issue: ${model.dateOfIssue}"),
                        Text("Valid Upto: ${model.validUpto}"),
                        Text("Place of Stay: ${model.placeOfStay}"),
                        Text("HS: ${model.hs}"),
                      ],
                    ),
                  ),
                );
              } else {
                return Text(
                  'No data scanned yet.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16.0, color: Colors.grey[700]),
                );
              }
            }),
          ],
        ),
      ),
    );
  }
}
