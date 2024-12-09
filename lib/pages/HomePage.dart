import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ilpverifyapp/controller/scancontroller.dart';

class HomePage extends StatefulWidget {
static const String routename = "HomePage";
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
 
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Initialize the HomeController
    Scancontroller controller = Get.find<Scancontroller>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // backgroundColor: const Color.fromARGB(255, 205, 240, 239),
        title: const Text(
          'ILP Card Verification',
          style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 3),
        ),
        centerTitle: true,
      ),
      body: GetBuilder<Scancontroller>(builder: (_) {
        return controller.iswaitingfornextpage
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 100,
                      ),
                      // Title and Instructions
                      const Text(
                        'Verify Your Card',
                        style: TextStyle(
                            fontSize: 24.0, fontWeight: FontWeight.bold),
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
                      const Text(
                        'OR',
                        style: TextStyle(
                            fontSize: 20, fontStyle: FontStyle.italic),
                      ),
                      const SizedBox(height: 30.0),
                      Row(
                        children: [
                          Expanded(
                            flex: 2, // Adjust flex values as needed
                            child: TextFormField(
                              // scrollPadding: const EdgeInsets.only(bottom: 100),
                              controller: controller.permitController,
                              decoration: InputDecoration(
                                hintText: 'Enter Permit Number',
                                hintStyle: const TextStyle(
                                  color: Color.fromARGB(179, 128, 127, 127),
                                ),
                                filled: true,
                                fillColor:
                                    const Color.fromARGB(255, 239, 241, 234),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 0, 10, 38)),
                            ),
                          ),
                          const SizedBox(
                              width:
                                  8), // Add spacing between the TextField and Button
                          controller.isverifybuttonpress
                              ? const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: CircularProgressIndicator(),
                                )
                              : ElevatedButton(
                                  onPressed: () {
                                    controller.verifyiilpdata();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.green,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    minimumSize: const Size(
                                        100, 50), // Minimum size for the button
                                  ),
                                  child: const Text(
                                    'Verify',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                        ],
                      )
                    ],
                  ),
                ),
              );
      }),
    );
  }
}
