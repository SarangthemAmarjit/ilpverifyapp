import 'dart:developer';

import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:ilpverifyapp/const/enum.dart';
import 'package:ilpverifyapp/controller/scancontroller.dart';
import 'package:ilpverifyapp/widget/dasboardcaard.dart';
import 'package:lottie/lottie.dart';

import 'scanner/scanneroverlay.dart';

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

    return SizedBox(

      child: GetBuilder<Scancontroller>(builder: (_) {
        log("isscantab : ${controller.isscantab}");
        return controller.iswaitingfornextpage
            ? Center(
                child: Lottie.asset(
                  'assets/images/loading.json',
                  height: 120,
                ),
              )
            : Container(
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: const AssetImage('assets/images/bghome2.png'),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      Colors.white.withOpacity(0.6),
                      BlendMode.lighten,
                    ),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 16, left: 20, right: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Hi, Admin Welcome Back',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.grey,
                              ),
                            )).animate().fadeIn().slideY(begin: 1,end: 0),
                        const DashboardCard().animate().fadeIn().scaleXY(begin: 0.5,end: 1),
                        // Title and Instructions

                        // Text(
                        //   'Tap the button below to scan the QR code on the card and verify its authenticity.',
                        //   textAlign: TextAlign.center,
                        //   style: TextStyle(
                        //       fontSize: 16.0,
                        //       color: Colors.grey[600],
                        //       fontStyle: FontStyle.italic),
                        // ),
                        const SizedBox(height: 30.0),
                        CustomSlidingSegmentedControl<SegmentType>(
                          isStretch: true,
                          children: {
                            SegmentType.scan: Text(
                              'Scan Verification',
                              style: controller.isscantab
                                  ? const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)
                                  : const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal),
                            ),
                            SegmentType.manual: Text(
                              'Manual Verification',
                              overflow: TextOverflow.ellipsis,
                              style: controller.isscantab
                                  ? const TextStyle(
                                      // color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal)
                                  : const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                            ),
                          },
                          thumbDecoration: BoxDecoration(
                            color: greencol,
                            border: Border.all(
                                color:
                                    const Color.fromARGB(255, 240, 197, 193)),
                            borderRadius: BorderRadius.circular(7),
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color:
                                    const Color.fromARGB(255, 197, 196, 196)),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            // gradient: const LinearGradient(
                            //   begin: Alignment.topLeft,
                            //   end: Alignment(0.7, 0.0),
                            //   colors: [
                            //     Color(0xffee0000),
                            //     Color(0xffeeee00),
                            //   ],
                            // ),
                          ),
                          onValueChanged: (v) {
                            controller.setsegmenttype(type: v);
                          },
                        ).animate().fadeIn().slideY(begin: 3,end: 0),

                        //  Scan Button
                        controller.isscantab
                            ? Column(
                                children: [
                                  const SizedBox(
                                    height: 50,
                                  ),
                                  ShaderMask(
                                    shaderCallback: (bounds) =>
                                        const LinearGradient(
                                      colors: [
                                        Color.fromARGB(255, 143, 23, 23),
                                        // Color.fromARGB(255, 23, 110, 8),
                                        // Color.fromARGB(255, 13, 102, 179),
                                        Color.fromARGB(255, 29, 143, 23),
                                      ], // Replace with your gradient colors
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ).createShader(bounds),
                                    child: const Text(
                                      'Scan to Verify',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 24.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors
                                            .white, // The color here is required but doesn't affect the gradient
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Get.to(() =>
                                          const BarcodeScannerWithOverlay());
                                      controller.listenScan();
                                    },
                                    child: Card(
                                      color: Colors.white,
                                      elevation: 4,
                                      child: Padding(
                                        padding: const EdgeInsets.all(25),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Image.asset(
                                            width: 200,
                                            'assets/images/scanner.png',
                                          ),
                                        ),
                                      ),
                                    ).animate().shimmer(color: Colors.grey[200],delay: Durations.extralong2,duration: const Duration(milliseconds: 600)),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Click and scan the ILP QR Code.',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.grey[600],
                                        fontStyle: FontStyle.italic),
                                  ),
                                  const SizedBox(height: 20.0),
                                ],
                              )
                                .animate()
                                .fadeIn(duration: Durations.medium4)
                                .scaleXY(
                                    begin: 0.6,
                                    end: 1,
                                    duration: const Duration(milliseconds: 300))
                            :

                            // const Text(
                            //   'OR',
                            //   style: TextStyle(
                            //       fontSize: 20, fontStyle: FontStyle.italic),
                            // ),
                            // const SizedBox(height: 20.0),
                            Column(
                                children: [
                                  const SizedBox(
                                    height: 80,
                                  ),
                                  ShaderMask(
                                    shaderCallback: (bounds) =>
                                        const LinearGradient(
                                      colors: [
                                        Color.fromARGB(255, 143, 23, 23),
                                        // Color.fromARGB(255, 23, 110, 8),
                                        // Color.fromARGB(255, 13, 102, 179),
                                        Color.fromARGB(255, 29, 143, 23),
                                      ], // Replace with your gradient colors
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ).createShader(bounds),
                                    child: const Text(
                                      'Enter Permit Number',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 24.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors
                                            .white, // The color here is required but doesn't affect the gradient
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  TextFormField(
                                    controller: controller.permitController,
                                    decoration: InputDecoration(
                                      labelStyle: const TextStyle(
                                        color:
                                            Color.fromARGB(179, 128, 127, 127),
                                      ),
                                      labelText: 'Permit Number',
                                      hintText: "Eg: IATXXXXXXXX.....XXX",
                                      hintStyle: const TextStyle(
                                          color: Color.fromARGB(
                                              179, 128, 127, 127),
                                          fontSize: 14),
                                      filled: true,
                                      fillColor: const Color.fromARGB(
                                          255, 239, 241, 234),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    style: const TextStyle(
                                      color: Color.fromARGB(255, 0, 10, 38),
                                    ),
                                  ),
                                  const SizedBox(
                                      height:
                                          25), // Add spacing between the TextField and Button
                                  ElevatedButton(
                                    onPressed: () {
                                      //to check if the button is loading or calling data
                                      //if it is press the function is not called
                                      if (!controller.isverifybuttonpress) {
                                        if (controller
                                            .permitController.text.isEmpty) {
                                          Get.snackbar("Error",
                                              "Permit number cannot be empty",
                                              backgroundColor:
                                                  const Color.fromARGB(
                                                      255, 233, 92, 92),
                                              colorText: Colors.white,
                                              snackPosition:
                                                  SnackPosition.BOTTOM);
                                        } else {
                                          controller.verifyiilpdata();
                                        }
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: greencol,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      minimumSize: const Size(100,
                                          50), // Minimum size for the button
                                    ),
                                    child: controller.isverifybuttonpress
                                        ? const SizedBox(
                                          height: 20,
                                          width: 20,
                                          child: CircularProgressIndicator(color: Colors.white,))
                                        : const Text(
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
                                .animate()
                                .fadeIn(duration: Durations.medium4)
                                .scaleXY(
                                    begin: 0.6,
                                    end: 1,
                                    duration: const Duration(milliseconds: 300))
                      ],
                    ),
                  ),
                ),
              );
      }),
    );
  }
}
