import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ilpverifyapp/controller/authcontroller.dart';
import 'package:ilpverifyapp/pages/loadingpage.dart';
import 'package:ilpverifyapp/pages/loginpage.dart';
import 'package:ilpverifyapp/pages/navbar.dart';

class AuthhandlerPage extends StatelessWidget {
  const AuthhandlerPage({super.key});

  @override
  Widget build(BuildContext context) {
    LoginController authcontroller = Get.find<LoginController>();
    log("islogin : ${authcontroller.islogin}");
    return GetBuilder<LoginController>(builder: (_) {
      return authcontroller.isauthchecking
          ? const LoadingPage()
          : authcontroller.islogin
              ? const MainScreen()
              : const LoginPage();
    });
  }
}
