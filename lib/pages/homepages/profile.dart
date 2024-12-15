import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:ilpverifyapp/controller/scancontroller.dart';
import 'package:ilpverifyapp/pages/homepages/verifiedlist.dart';

import '../../controller/authcontroller.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Scancontroller>(builder: (controller) {
      return SingleChildScrollView(
        child: SizedBox(
          width: double.maxFinite,
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              const CircleAvatar(
                radius: 50,
                backgroundColor: Colors.blue,
                child: TitleText(
                  title: "T",
                  color: Colors.white,
                ),
              ),
              const TitleText(
                title: "Tomba Heigrujam",
              ),
              const SizedBox(
                height: 20,
              ),
              const RoundedCard(
                isGradient: true,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      FontAwesomeIcons.qrcode,
                      color: Colors.white,
                      size: 14,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "12 Cards Verified",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ).animate().fadeIn().shimmer(duration: Durations.extralong2),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Divider(),
              ),
              const RoundedCard(
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: ListTile(
                  leading: Icon(
                    FontAwesomeIcons.question,
                    size: 18,
                  ),
                  title: Text("How To Scan"),
                  trailing: Icon(
                    FontAwesomeIcons.arrowRight,
                    size: 14,
                  ),
                ),
              ),
              const RoundedCard(
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: ListTile(
                  leading: Icon(
                    FontAwesomeIcons.info,
                    size: 18,
                  ),
                  title: Text("About"),
                  trailing: Icon(
                    FontAwesomeIcons.arrowRight,
                    size: 14,
                  ),
                ),
              ),
              const RoundedCard(
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: ListTile(
                  leading: Icon(
                    FontAwesomeIcons.android,
                    size: 18,
                  ),
                  title: Text("App Version"),
                  subtitle: Text("1.0.0"),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  RoundedCard(
                      onPress: () {
                     controller.onItemTapped(3, context);
        
                      },
                      margin: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            FontAwesomeIcons.arrowRightFromBracket,
                            size: 14,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          const Text("Log Out"),
                        ],
                      )),
                ],
              )
            ],
          ),
        ),
      );
    });
  }
}

class TitleText extends StatelessWidget {
  const TitleText({
    super.key,
    required this.title,
    this.color,
  });
  final String title;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(fontSize: 24, color: color),
    );
  }
}
