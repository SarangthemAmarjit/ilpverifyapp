import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:ilpverifyapp/const/constant.dart';
import 'package:ilpverifyapp/controller/authcontroller.dart';
import 'package:ilpverifyapp/controller/scancontroller.dart';
import 'package:ilpverifyapp/pages/HomePage.dart';
import 'package:ilpverifyapp/pages/homepages/profile.dart';
import 'package:ilpverifyapp/pages/internetconnectivity/internetconnectivity.dart';

import 'homepages/verifiedlist.dart';

class MainScreen extends StatefulWidget {
  static const String routename = "/homescreen";
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomePage(), // Replace with your actual HomePage implementation
    const VerifiedListPage(),
    const ProfilePage(), // Placeholder for logout button; it won't navigate
  ];

  void _onItemTapped(int index) {
    if (index == 3) {
      _showLogoutDialog();
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  void _showLogoutDialog() {
    LoginController logcontroller = Get.find<LoginController>();
    Scancontroller scancontroller = Get.find<Scancontroller>();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, s) {
          return AlertDialog(
                   title: const Row(
                                             children: [
                                                      Icon(FontAwesomeIcons.arrowRightFromBracket,size: 14,),
                                                      SizedBox(width: 10,),
                                               Text('Logout'),
                                             ],
                                           ),
            content: const Text('Are you sure you want to log out?'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  logcontroller.logout();
                  scancontroller.resetbools();
                },
                child: const Text('Log Out'),
              ),
            ],
          );
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Scancontroller>(
      builder: (controller) {
        return Scaffold(
                backgroundColor: Colors.white,
          appBar: AppBar(
            // backgroundColor: const Color.fromARGB(255, 205, 240, 239),
            title: const Text(
              'ILP VERIFIER',
              style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 3),
            ),
            centerTitle: true,
            actions: [
             Obx (
              ()=>
                controller.isConnected.value?Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: IconButton(icon: const Icon(FontAwesomeIcons.powerOff,size: 16,),onPressed:(){_onItemTapped(3);},),
                ):const SizedBox(),
              )
            ],
          ),
          body:Obx(()=>controller.isConnected.value? _pages[_selectedIndex]:const InternetConnectivityPage()),
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
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
          ),
        );
      }
    );
  }
}

