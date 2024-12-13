import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:ilpverifyapp/const/constant.dart';
import 'package:ilpverifyapp/controller/authcontroller.dart';
import 'package:ilpverifyapp/controller/scancontroller.dart';
import 'package:ilpverifyapp/pages/HomePage.dart';
import 'package:ilpverifyapp/pages/homepages/profile.dart';
import 'package:ilpverifyapp/pages/loadingpage.dart';

import 'homepages/verifiedlist.dart';

class MainScreen extends StatelessWidget {
  static const String routename = "/homescreen";
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Scancontroller scancontroller = Get.find<Scancontroller>();
    return WillPopScope(
      onWillPop: () async {
        final shouldExit = await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Exit App'),
            content: const Text('Are you sure you want to exit the app?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text('Exit'),
              ),
            ],
          ),
        );
        return shouldExit ?? false;
      },
      child: GetBuilder<Scancontroller>(builder: (_) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            // backgroundColor: const Color.fromARGB(255, 205, 240, 239),
            title: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  height: 38,
                ),
                const Text(
                  'Scanner',
                  style:
                      TextStyle(fontWeight: FontWeight.bold, letterSpacing: 3),
                ),
              ],
            ),
            centerTitle: true,
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: IconButton(
                  icon: const Icon(
                    FontAwesomeIcons.powerOff,
                    size: 16,
                  ),
                  onPressed: () {
                    scancontroller.onItemTapped(3, context);
                  },
                ),
              )
            ],
          ),
          body: navpages[scancontroller.selectedIndex],
          bottomNavigationBar: BottomNavigationBar(
              selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
              elevation: 10,
              selectedFontSize: 16,
              selectedItemColor: greencol,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.qr_code_scanner),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.list),
                  label: ' Permits',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                ),
              ],
              currentIndex: scancontroller.selectedIndex,
              onTap: (index) {
                scancontroller.onItemTapped(index, context);
              }),
        );
      }),
    );
  }
}
