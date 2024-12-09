import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ilpverifyapp/controller/authcontroller.dart';
import 'package:ilpverifyapp/controller/scancontroller.dart';
import 'package:ilpverifyapp/pages/loginpage.dart';
import 'package:ilpverifyapp/pages/navbar.dart';

class AuthhandlerPage extends StatelessWidget {
  const AuthhandlerPage({super.key});

  @override
  Widget build(BuildContext context) {
    LoginController scancontroller = Get.find<LoginController>();

    return GetBuilder<Scancontroller>(builder: (_) {
      return scancontroller.isloginloading?const Scaffold(body: Center(child:CircularProgressIndicator(color: Colors.green,)),): scancontroller.islogin ? const MainScreen() : const LoginPage();
    });
  }
}
