import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ilpverifyapp/controller/authcontroller.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.put(LoginController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: const AssetImage('assets/images/bg4.png'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.3),
                BlendMode.darken,
              ),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome to Manipur',
                style: GoogleFonts.greatVibes(
                  fontSize: 45,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
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
                        borderRadius: BorderRadius.circular(15)),
                    elevation: 10,
                    child: Container(
                      width: 350,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromARGB(255, 192, 191, 191)),
                        color: const Color(0xFF2C2C2C).withOpacity(0.5),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
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
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                ),
                              ),
                              Text(
                                'Log in to your Account',
                                style: GoogleFonts.kulimPark(
                                  color: Colors.white54,
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
                              fillColor: const Color(0xFF3A3A3A),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              prefixIcon: const Icon(
                                FontAwesomeIcons.user,
                                color: Color.fromARGB(255, 222, 228, 211),
                                size: 20,
                              ),
                            ),
                            style: const TextStyle(color: Colors.white),
                          ),
                          const SizedBox(height: 15),
                          TextField(
                            scrollPadding: const EdgeInsets.only(bottom: 200),
                            controller: controller.passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: 'Password',
                              hintStyle: const TextStyle(
                                color: Color.fromARGB(179, 128, 127, 127),
                              ),
                              filled: true,
                              fillColor: const Color(0xFF3A3A3A),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              prefixIcon: const Icon(
                                FontAwesomeIcons.lock,
                                color: Color.fromARGB(255, 222, 228, 211),
                                size: 20,
                              ),
                            ),
                            style: const TextStyle(color: Colors.white),
                          ),
                          const SizedBox(height: 15),
                          Obx(() => Row(
                                children: [
                                  Checkbox(
                                    value: controller.isStayed.value,
                                    onChanged: (value) {
                                      controller.isStayed.value = value!;
                                    },
                                    activeColor: Colors.green,
                                  ),
                                  const Text(
                                    'Stay signed in',
                                    style: TextStyle(color: Colors.white70),
                                  ),
                                ],
                              )),
                          const SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: controller.validateAndLogin,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
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
