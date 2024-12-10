import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DashboardCard extends StatelessWidget {
  const DashboardCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 18),
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(12.0),
        ),
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Total Verified Section
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total Verified",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "10", // Example count
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),

              // Validated and Faked Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Validated Section
                  Row(
                    children: [
                      Container(
                        height: 43,
                        width: 43,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                                color:
                                    const Color.fromARGB(136, 188, 186, 186))),
                        child: Opacity(
                          opacity: 0.5,
                          child: Image.asset(
                            'assets/images/valid2.png',
                            height: 20,
                          ),
                        ),
                      ),
                      // Icon(
                      //   FontAwesomeIcons.checkToSlot,
                      //   color: Color.fromARGB(255, 185, 244, 187),
                      //   size: 45,
                      // ),
                      const SizedBox(width: 12),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "Valid",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "8 Cards", // Example count
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  // Faked Section
                  Row(
                    children: [
                      // Icon(
                      //   FontAwesomeIcons.triangleExclamation,
                      //   color: Color.fromARGB(255, 219, 190, 188),
                      //   size: 45,
                      // ),
                      Container(
                        height: 43,
                        width: 43,
                        decoration: BoxDecoration(
                          // color: const Color.fromARGB(255, 212, 192, 191)
                          //     .withOpacity(0.5),
                          border: Border.all(
                              color: const Color.fromARGB(136, 188, 186, 186)),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(8),
                                bottomRight: Radius.circular(8),
                                topRight: Radius.circular(8)),
                            child: Opacity(
                              opacity:
                                  0.5, // Value from 0.0 (completely transparent) to 1.0 (fully opaque)
                              child: Image.asset(
                                'assets/images/fakeok2.png',
                                height: 25,
                              ),
                            )),
                      ),
                      const SizedBox(width: 12),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "Fake",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "2 Cards", // Example count
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
