import 'package:flutter/material.dart';
import 'package:ilpverifyapp/pages/HomePage.dart';
import 'package:ilpverifyapp/pages/homepages/profile.dart';
import 'package:ilpverifyapp/pages/homepages/verifiedlist.dart';

enum SegmentType { scan, manual }

Color greencol = const Color(0xff008631);
Color bordercolor = const Color.fromARGB(255, 179, 179, 179);
Color bordercolorsecondary = const Color.fromARGB(255, 221, 220, 220);
Color greencolsecondary = const Color(0xff008631).withOpacity(0.3);
Color greencoltextfocus = const Color(0xff008631).withOpacity(0.5);

final List<Widget> navpages = [
  const HomePage(), // Replace with your actual HomePage implementation
  const VerifiedListPage(),
  const ProfilePage(), // Placeholder for logout button; it won't navigate
];

final List<String> cardstatus = ['Valid', 'Expire', 'Fake'];
