import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:ilpverifyapp/controller/scancontroller.dart';
import 'package:ilpverifyapp/widget/profile.dart';

import '../config/usecase.dart';

class ApplicantProfileDetails extends StatelessWidget {
  const ApplicantProfileDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Scancontroller controller = Get.find<Scancontroller>();

    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (v, i) {
        controller.deleteScanmodel();
      },
      child: GetBuilder<Scancontroller>(builder: (_) {
        return Scaffold(
            backgroundColor: const Color.fromARGB(255, 232, 240, 228),
            appBar: AppBar(
              backgroundColor: controller.isfake ? Colors.red : Colors.green,
              title: const Text("Verification"),
            ),
            body: controller.allgetiltpdata == null
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : SingleChildScrollView(
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                            controller.isfake ? Colors.red : Colors.green,
                            controller.isfake
                                ? Colors.red[100]!
                                : Colors.green[100]!,
                            Colors.white
                          ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter)
                          // image: DecorationImage(
                          //   image: const AssetImage('assets/images/bg4.png'),
                          //   fit: BoxFit.cover,
                          //   colorFilter: ColorFilter.mode(
                          //     const Color.fromARGB(255, 137, 229, 141).withOpacity(0.1),
                          //     BlendMode.darken,
                          //   ),
                          // ),
                          ),
                      child: Stack(children: [
                        Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Stack(
                              // alignment: Alignment.center,
                              children: [
                                // Column(
                                //   children: [
                                //     ClipPath(
                                //       clipper: WaveClipperTwo(flip: true),
                                //       child: Container(
                                //         height: 200,
                                //         width: MediaQuery.of(context).size.width,
                                //         decoration: BoxDecoration(
                                //             color: const Color.fromARGB(
                                //                 255, 237, 237, 227),
                                //             image: DecorationImage(
                                //                 image: NetworkImage(controller
                                //                     .allgetiltpdata!.photo),
                                //                 opacity: 0.5,
                                //                 fit: BoxFit.cover)),
                                //       ),
                                //     ),
                                //     const SizedBox(
                                //       height: 50,
                                //     )
                                //   ],
                                // ),
                                Column(
                                  children: [
                                    const SizedBox(
                                      height: 40,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Container(
                                            height: 150,
                                            width: 150,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              // borderRadius:
                                              //     BorderRadius.circular(30),
                                              border: Border.all(
                                                  color: Colors.green,
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
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "${controller.allgetiltpdata?.name}",
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          letterSpacing: 5,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(16),
                                      margin: const EdgeInsets.all(16),
                                      width: double.maxFinite,
                                      decoration: BoxDecoration(
                                          gradient: LinearGradient(colors: [
                                            Colors.blue[900]!,
                                            Colors.blue
                                          ]),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: Colors.blueGrey),
                                      child: Column(
                                        children: [
                                          const Row(
                                            children: [
                                              Expanded(
                                                  child: Text(
                                                "Issued",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20),
                                                textAlign: TextAlign.center,
                                              )),
                                              Expanded(
                                                  child: Text(
                                                "Upto",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20),
                                                textAlign: TextAlign.center,
                                              )),
                                            ],
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                child: Column(
                                                  children: [
                                                    const SizedBox(
                                                      height: 20,
                                                    ),
                                                    Text(
                                                      dateTimetoString(
                                                          controller
                                                              .allgetiltpdata!
                                                              .issueDate),
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: const TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 16),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                alignment:
                                                    Alignment.bottomCenter,
                                                width: 0.5,
                                                height: 40,
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 8,
                                                        horizontal: 8),
                                                color: Colors.white,
                                              ),
                                              Expanded(
                                                child: Column(
                                                  children: [
                                                    const SizedBox(
                                                      height: 20,
                                                    ),
                                                    Text(
                                                      dateTimetoString(
                                                          controller
                                                              .allgetiltpdata!
                                                              .validDate),
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: const TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 16),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          const Text(
                                            "Remaining Days",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20),
                                            textAlign: TextAlign.center,
                                          ),
                                          Text(
                                            remainingDays(controller
                                                    .allgetiltpdata!.validDate)
                                                .toString(),
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 20),
                                            textAlign: TextAlign.center,
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                        padding: const EdgeInsets.all(16),
                                        margin: const EdgeInsets.all(16),
                                        width: double.maxFinite,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: controller.isfake ||
                                                  remainingDays(controller
                                                          .allgetiltpdata!
                                                          .validDate) <
                                                      1
                                              ? Colors.red
                                              : Colors.green,
                                          gradient: LinearGradient(
                                              begin: Alignment.bottomRight,
                                              end: Alignment.topLeft,
                                              colors: [
                                                controller.isfake ||
                                                        remainingDays(controller
                                                                .allgetiltpdata!
                                                                .validDate) <
                                                            1
                                                    ? Colors.red[200]!
                                                    : Colors.green[300]!,
                                                controller.isfake ||
                                                        remainingDays(controller
                                                                .allgetiltpdata!
                                                                .validDate) <
                                                            1
                                                    ? Colors.red
                                                    : Colors.green
                                              ]),
                                        ),
                                        child: Row(
                                          children: [
                                            Icon(
                                              controller.isfake ||
                                                      remainingDays(controller
                                                              .allgetiltpdata!
                                                              .validDate) <
                                                          1
                                                  ? FontAwesomeIcons.exclamation
                                                  : Icons
                                                      .check_circle_outline_outlined,
                                              color: Colors.white,
                                              size: 18,
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              controller.isfake
                                                  ? "Card Not Valid"
                                                  : remainingDays(controller
                                                              .allgetiltpdata!
                                                              .validDate) <
                                                          1
                                                      ? "Card is Expired"
                                                      : "Card is Valid",
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20),
                                            ),
                                          ],
                                        )),
                                  ],
                                ),
                              ],
                            ),
                            // Padding(
                            //   padding: const EdgeInsets.symmetric(horizontal: 20),
                            //   child: Container(
                            //     height: 2,
                            //     width: MediaQuery.of(context).size.width,
                            //     color: const Color.fromARGB(255, 244, 171, 196),
                            //   ),
                            // ),
                            const SizedBox(
                              height: 30,
                            ),
                            Container(
                              // padding: EdgeInsets.all(16),
                              margin: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.white),
                              child: Column(
                                children: [
                                  ProfileUpdate(
                                    text1: "Name : ",
                                    text2: controller.allgetiltpdata!.name,
                                    icon: Icons.person,
                                  ),
                                  ProfileUpdate(
                                    text1: "Permit Type: ",
                                    text2:
                                        controller.allgetiltpdata!.permitType,
                                    icon: Icons.assignment,
                                  ),
                                  ProfileUpdate(
                                    text1: "Permit No: ",
                                    text2: controller.allgetiltpdata!.permitNo,
                                    icon: Icons.confirmation_number,
                                  ),
                                  ProfileUpdate(
                                    text1: "Parent Name: ",
                                    text2:
                                        controller.allgetiltpdata!.parentName,
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
                                    text2: controller
                                        .allgetiltpdata!.residingPlace,
                                    icon: Icons.location_on,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                        Positioned(
                          bottom: 0,
                          top: 300,
                          left: 0,
                          right: 0,
                          child: controller.isfake
                              ? Center(
                                  child: Image.asset(
                                    'assets/images/fake.png',
                                    height: 150,
                                  ),
                                )
                              : controller.isvalided
                                  ? Center(
                                      child: Image.asset(
                                        'assets/images/validseal.png',
                                        height: 150,
                                      ),
                                    )
                                  : controller.isexpired
                                      ? Center(
                                          child: Image.asset(
                                            'assets/images/expiredseal.png',
                                            height: 150,
                                          ),
                                        )
                                      : const SizedBox(),
                        )
                      ]),
                    ),
                  ));
      }),
    );
  }
}