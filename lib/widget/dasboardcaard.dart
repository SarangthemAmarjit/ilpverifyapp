import 'package:flutter/material.dart';

class DashboardCard extends StatelessWidget {
  const DashboardCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 10, bottom: 25),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: DashbaordCardWidget(
                    icon: 'assets/images/total.png',
                    title: 'Total Verified',
                    number: 10,
                    numcolor: Colors.blue),
              ),
              Expanded(
                child: DashbaordCardWidget(
                    icon: 'assets/images/valid2.png',
                    title: 'Valid',
                    number: 8,
                    numcolor: Colors.green),
              )
            ],
          ),
          Row(
            children: [
              Expanded(
                child: DashbaordCardWidget(
                    icon: 'assets/images/expiredicon.png',
                    title: 'Expired',
                    number: 1,
                    numcolor: Colors.orange),
              ),
              Expanded(
                child: DashbaordCardWidget(
                    icon: 'assets/images/fakeok.png',
                    title: 'Fake',
                    number: 1,
                    numcolor: Colors.red),
              )
            ],
          )
        ],
      ),
    );
  }
}

class DashbaordCardWidget extends StatelessWidget {
  final String icon;
  final String title;
  final int number;
  final Color numcolor;
  const DashbaordCardWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.number,
    required this.numcolor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
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
                icon,
                height: 34,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "$number ${number<2?"Card":"Cards"}", // Example count
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: numcolor),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
