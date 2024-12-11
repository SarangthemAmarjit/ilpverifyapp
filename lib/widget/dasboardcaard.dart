import 'package:flutter/material.dart';

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
        elevation: 2,
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
                      Opacity(
                        opacity: 0.5,
                        child: Image.asset(
                          'assets/images/valid2.png',
                          height: 45,
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
                      Opacity(
                        opacity:
                            0.5, // Value from 0.0 (completely transparent) to 1.0 (fully opaque)
                        child: Image.asset(
                          'assets/images/fakeok.png',
                          height: 45,
                        ),
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
