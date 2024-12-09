import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ilpverifyapp/pages/navbar.dart';

import '../model/usermodel.dart';

class LoginController extends GetxController {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  var isStayed = false.obs;
  var isObscured = true.obs;
  final String correctUsername = "admin";
  final String correctPassword = "12345";
  User? _currentUser;
  bool isAuth = false;
  void setpasswordvisibility() {
    isObscured.value = !isObscured.value;
  }

  void validateAndLogin() {
    String username = usernameController.text;
    String password = passwordController.text;
    //get login api 
    if (username.isEmpty || password.isEmpty) {
      _showDialog("Error", "Username or Password cannot be empty.");
    } else if (username != correctUsername || password != correctPassword) {
      _showDialog("Login Failed", "Incorrect Username or Password.");
    } else {

      Get.offAllNamed(MainScreen.routename);
      _showDialog("Login Success", "Welcome, $username!");
      // Navigate to the next screen
    }
  }

  void authenticate(){
    if(isAuth){
         Get.off(() => const MainScreen());
    }
  }

  void _showDialog(String title, String message) {
    Get.dialog(
      AlertDialog(
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
