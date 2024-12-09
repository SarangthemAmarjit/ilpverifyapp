import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ilpverifyapp/controller/scancontroller.dart';
import 'package:ilpverifyapp/pages/loginpage.dart';
import 'package:ilpverifyapp/pages/navbar.dart';

class AuthhandlerPage extends StatelessWidget {
  const AuthhandlerPage({super.key});

  @override
  Widget build(BuildContext context) {
    Scancontroller scancontroller = Get.find<Scancontroller>();

    return scancontroller.islogin ? const MainScreen() : const LoginPage();
  }
}
