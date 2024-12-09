import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:ilpverifyapp/controller/scancontroller.dart';
import 'package:ilpverifyapp/widget/profile.dart';

class ApplicantProfile extends StatelessWidget {
  const ApplicantProfile({super.key});

  @override
  Widget build(BuildContext context) {
    Scancontroller controller = Get.put(Scancontroller());

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 232, 240, 228),
      appBar: AppBar(
        title: const Text("Verification"),
      ),
      body: GetBuilder<Scancontroller>(builder: (_) {
        return Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: const AssetImage('assets/images/bg4.png'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                const Color.fromARGB(255, 137, 229, 141).withOpacity(0.1),
                BlendMode.darken,
              ),
            ),
          ),
          child: SafeArea(
              child: controller.allgetiltpdata == null
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : SingleChildScrollView(
                    child: Container(
                      child: Stack(children: [
                          Center(
                              child: Column(
                                                      children: [
                              const SizedBox(
                                height: 30,
                              ),
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  Column(
                                    children: [
                                      ClipPath(
                                        clipper: WaveClipperTwo(flip: true),
                                        child: Container(
                                          height: 200,
                                          width: MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                              color: const Color.fromARGB(
                                                  255, 237, 237, 227),
                                              image: DecorationImage(
                                                  image: NetworkImage(controller
                                                      .allgetiltpdata!.photo),
                                                  opacity: 0.5,
                                                  fit: BoxFit.cover)),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 50,
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      const SizedBox(
                                        height: 80,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 20),
                                        child: Align(
                                            alignment: Alignment.bottomLeft,
                                            child: Container(
                                              height: 110,
                                              width: 100,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                border: Border.all(
                                                    color: const Color.fromARGB(
                                                        255, 195, 237, 196),
                                                    width: 3),
                                                image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: NetworkImage(controller
                                                      .allgetiltpdata!.photo),
                                                ),
                                              ),
                                              child: FutureBuilder<void>(
                                                future: precacheImage(
                                                  NetworkImage(controller
                                                      .allgetiltpdata!.photo),
                                                  context,
                                                ),
                                                builder: (context, snapshot) {
                                                  if (snapshot.connectionState ==
                                                      ConnectionState.done) {
                                                    // Image is loaded
                                                    return const SizedBox
                                                        .shrink(); // Empty child as the image is already in decoration
                                                  } else if (snapshot.hasError) {
                                                    // Error loading image
                                                    return const Icon(Icons.error,
                                                        size: 50,
                                                        color: Colors.red);
                                                  } else {
                                                    // Loading indicator
                                                    return const Center(
                                                      child:
                                                          CircularProgressIndicator(),
                                                    );
                                                  }
                                                },
                                              ),
                                            )),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: Container(
                                  height: 2,
                                  width: MediaQuery.of(context).size.width,
                                  color: const Color.fromARGB(255, 244, 171, 196),
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              ProfileUpdate(
                                text1: "Name : ",
                                text2: controller.allgetiltpdata!.name,
                                icon: Icons.person,
                              ),
                              ProfileUpdate(
                                text1: "Permit Type: ",
                                text2: controller.allgetiltpdata!.permitType,
                                icon: Icons.assignment,
                              ),
                              ProfileUpdate(
                                text1: "Permit No: ",
                                text2: controller.allgetiltpdata!.permitNo,
                                icon: Icons.confirmation_number,
                              ),
                              ProfileUpdate(
                                text1: "Parent Name: ",
                                text2: controller.allgetiltpdata!.parentName,
                                icon: Icons.people,
                              ),
                              ProfileUpdate(
                                text1: "ID No: ",
                                text2: controller.allgetiltpdata!.idNo,
                                icon: Icons.badge,
                              ),
                              ProfileUpdate(
                                text1: "Date of Issue: ",
                                text2: controller.formatDateWithSuffix(
                                    controller.allgetiltpdata!.issueDate),
                                icon: Icons.date_range,
                              ),
                              ProfileUpdate(
                                text1: "Valid Upto: ",
                                text2: controller.formatDateWithSuffix(
                                    controller.allgetiltpdata!.validDate),
                                icon: Icons.calendar_today,
                              ),
                              ProfileUpdate(
                                text1: "Place of Stay: ",
                                text2: controller.allgetiltpdata!.residingPlace,
                                icon: Icons.location_on,
                              ),
                              const SizedBox(height: 20),
                                                      ],
                                                    )),
                          Positioned(
                          bottom: 0,

                          top: 300,
                          left: 0,
                          right: 0,
                            child:
                                  controller.isfake
                                      ? Center(
                                          child: Image.asset(
                                            'assets/images/fake.png',
                                            height: 150,
                                          ),
                                        )
                                      : controller.isvalided
                                          ? Center(
                                              child: Image.asset(
                                                'assets/images/verified.png',
                                                height: 150,
                                              ),
                                            )
                                          : const SizedBox(),
                       
                          )
                        ]),
                    ),
                  )),
        );
      }),
    );
  }
}
