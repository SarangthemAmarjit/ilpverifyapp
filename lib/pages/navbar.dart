import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ilpverifyapp/const/constant.dart';
import 'package:ilpverifyapp/controller/authcontroller.dart';
import 'package:ilpverifyapp/controller/scancontroller.dart';
import 'package:ilpverifyapp/pages/HomePage.dart';

import 'homepages/verifiedlist.dart';

class MainScreen extends StatefulWidget {
  static const String routename = "/homescreen";
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
 






  @override
  Widget build(BuildContext context) {
        
    Scancontroller scancontroller = Get.find<Scancontroller>();
    return GetBuilder<Scancontroller>(
      builder: (_) {
        return Scaffold(
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
                label: 'Verified List',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.logout),
                label: 'Log Out',
              ),
            ],
            currentIndex:scancontroller.selectedIndex,
          onTap: (value) {
            scancontroller.onItemTapped(value, context);
          },
          ),
        );
      }
    );
  }
}

