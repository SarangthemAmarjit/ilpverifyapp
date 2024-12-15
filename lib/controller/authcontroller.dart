import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:ilpverifyapp/model/repositories/authrepoimpl.dart';
import 'package:ilpverifyapp/pages/loadingpage.dart';
import 'package:ilpverifyapp/pages/loginpage.dart';
import 'package:ilpverifyapp/pages/navbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  final AuthRepoImpl authenticationRepo = AuthRepoImpl();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  var isStayed = false.obs;
  var isObscured = true.obs;
  final String correctUsername = "admin";
  final String correctPassword = "12345";
  bool isloginloading = false;
  bool _islogin = false;
  bool get islogin => _islogin;

  bool _isauthchecking = false;
  bool get isauthchecking => _isauthchecking;

  @override
  void onInit() {
    super.onInit();
    removesplash();

    // Call permission check when the controller initializes
  }

  void removesplash() async {
    log('ready in 1...');
    await Future.delayed(const Duration(milliseconds: 1))
        .whenComplete(() => FlutterNativeSplash.remove());
    await Future.delayed(const Duration(seconds: 2))
        .whenComplete(() => checktoken());
    log('complete splash...');
  }

  void setpasswordvisibility() {
    isObscured.value = !isObscured.value;
  }

  void logout() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.clear();
    checktoken();
    Get.offAll(const LoginPage());
  }

  void validateAndLogin(BuildContext context) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String username = usernameController.text;
    String password = passwordController.text;
    //get login api
    if (username.isEmpty || password.isEmpty) {
      _showDialog("Error", "Username or Password cannot be empty.");
    }
    //  else if (username != correctUsername || password != correctPassword) {
    //   _showDialog("Login Failed", "Incorrect Username or Password.");
    // }
    else {
      showLoadingDialog(context: context);
      Future.delayed(const Duration(milliseconds: 1500)).whenComplete(() async {
        //res = {"String":"int"} {1 - sucess,-1 - error,3 - catch exception}
        Map<String, String?> res =
            await authenticationRepo.loginUser(username, password);

        //set values to shared preferences is login is successfull
        // if (res.entries.first.value !=null) {
        //   _islogin = true;
        //   pref.setString('token', username);

        //   authenticate();
        //   update();
        //   _showDialog(res.entries.first.key, "Welcome, $username!");
        // }
        //Demo Login Details

        if (username == correctUsername || password == correctPassword) {
          _islogin = true;
          pref.setString('token', username);
          update();
          Navigator.of(context).pop();
          authenticate();

          _showDialog('Login Successfully', "Welcome, $username!");
        } else {
          Navigator.of(context).pop();
          _showDialog("Log In Error!", res.entries.first.key);
        }
      });
      // Navigate to the next screen
    }
  }

  void authenticate() {
    if (_islogin) {
      Get.off(() => const MainScreen());
    }
  }

  checktoken() async {
    _isauthchecking = true;
    update();

    SharedPreferences pref = await SharedPreferences.getInstance();
    if (pref.containsKey('token')) {
       Future.delayed(const Duration(milliseconds: 1500)).whenComplete(() {
        _islogin = true;

        _isauthchecking = false;
        update();
        log('trueeeee');
      });
    } else {
       Future.delayed(const Duration(milliseconds: 1500)).whenComplete(() {
        _islogin = false;

        _isauthchecking = false;
        update();
        log('falsesssss');
      });
    }
    isloginloading = false;
    update();
  }

  void _showDialog(String title, String message) {
    Get.dialog(
      AlertDialog(
        backgroundColor: Colors.white,
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }
}
