import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ilpverifyapp/const/constant.dart';
import 'package:ilpverifyapp/controller/authcontroller.dart';
import 'package:ilpverifyapp/pages/loadingpage.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.put(LoginController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: const AssetImage('assets/images/bghome2.png'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.2),
                BlendMode.lighten,
              ),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ShaderMask(
                shaderCallback: (bounds) => const LinearGradient(
                  colors: [Colors.green, Colors.blue],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ).createShader(bounds),
                blendMode: BlendMode.srcIn,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    'Welcome to Manipur',
                    style: GoogleFonts.greatVibes(
                      fontWeight: FontWeight.bold,
                      fontSize: 45,
                      color: Colors.white, // Required for ShaderMask
                    ),
                    textAlign: TextAlign.center,
                  ),
                ), // Ensures proper masking
              ),
              const SizedBox(height: 10),
              Text(
                '- THE JEWELLED LAND -',
                style: GoogleFonts.merriweather(
                  letterSpacing: 3,
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 1
                    ..color = Colors.orange,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 50),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Card(
                    color: Colors.transparent,
                    shape: RoundedRectangleBorder(
                        side: const BorderSide(
                            color: Color.fromARGB(255, 192, 191, 191)),
                        borderRadius: BorderRadius.circular(15)),
                    elevation: 10,
                    child: Container(
                      width: 350,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromARGB(255, 171, 171, 171)),
                        color: const Color.fromARGB(255, 218, 225, 209)
                            .withOpacity(0.5),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(255, 194, 193, 193)
                                .withOpacity(0.3),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'assets/images/logo.png',
                            height: 50,
                          ),
                          const SizedBox(height: 20),
                          Column(
                            children: [
                              Text(
                                'Welcome!',
                                style: GoogleFonts.kulimPark(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                ),
                              ),
                              Text(
                                'Log in to your Account',
                                style: GoogleFonts.kulimPark(
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            scrollPadding: const EdgeInsets.only(bottom: 270),
                            controller: controller.usernameController,
                            decoration: InputDecoration(
                              hintText: 'Username',
                              hintStyle: const TextStyle(
                                color: Color.fromARGB(179, 128, 127, 127),
                              ),
                              filled: true,
                              fillColor:
                                  const Color.fromARGB(255, 233, 231, 231),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      BorderSide(color: greencoltextfocus)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: bordercolor)),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              prefixIcon: Icon(
                                FontAwesomeIcons.user,
                                color: greencol,
                                size: 20,
                              ),
                            ),
                            style: const TextStyle(color: Colors.black),
                          ),
                          const SizedBox(height: 15),
                          Obx(
                            () => TextField(
                              scrollPadding: const EdgeInsets.only(bottom: 200),
                              controller: controller.passwordController,
                              obscureText: controller.isObscured.value,
                              decoration: InputDecoration(
                                hintText: 'Password',
                                hintStyle: const TextStyle(
                                  color: Color.fromARGB(179, 128, 127, 127),
                                ),
                                filled: true,
                                fillColor:
                                    const Color.fromARGB(255, 233, 231, 231),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide:
                                        BorderSide(color: greencoltextfocus)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: bordercolor)),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                prefixIcon: Icon(
                                  FontAwesomeIcons.lock,
                                  color: greencol,
                                  size: 20,
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    controller.isObscured.value
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: greencol,
                                  ),
                                  onPressed: () {
                                    controller.setpasswordvisibility();
                                  },
                                ),
                              ),
                              style: const TextStyle(color: Colors.black),
                            ),
                          ),
                          const SizedBox(height: 15),
                          Obx(() => Row(
                                children: [
                                  Checkbox(
                                      value: controller.isStayed.value,
                                      onChanged: (value) {
                                        controller.isStayed.value = value!;
                                      },
                                      activeColor: greencol),
                                  const Text(
                                    'Stay signed in',
                                    style: TextStyle(
                                      color: Colors.black54,
                                    ),
                                  ),
                                ],
                              )),
                          const SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () {
                              showLoadingDialog(context: context);
                              controller.validateAndLogin();
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              minimumSize: const Size(double.infinity, 50),
                            ),
                            child: const Text(
                              'LOG IN',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.white),
                            ),
                          ),
                          const SizedBox(height: 30),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
