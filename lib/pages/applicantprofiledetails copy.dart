import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:ilpverifyapp/const/constant.dart';
import 'package:ilpverifyapp/controller/scancontroller.dart';
import 'package:ilpverifyapp/widget/profile.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../config/usecase.dart';
import '../widget/shimmer.dart';

class ApplicantProfileDetails2 extends StatelessWidget {
  const ApplicantProfileDetails2({super.key});

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
            // backgroundColor: Colors.grey[800],
            appBar: AppBar(
              // backgroundColor: controller.isfake?Colors.red:Colors.green,
              // backgroundColor: Colors.grey[800],
              title: const Text("Verification"),
            ),
            body: controller.allgetiltpdata == null
                ? const ShimmerCards()
                : Container(
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: const AssetImage('assets/images/bghome.png'),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                          const Color.fromARGB(255, 231, 232, 231)
                              .withOpacity(0.6),
                          BlendMode.lighten,
                        ),
                      ),
                    ),
                    //                    decoration: BoxDecoration(
                    //   // gradient: LinearGradient(colors: [controller.isfake? Colors.red: Colors.green,controller.isfake? Colors.red[100]!: Colors.green[100]!,Colors.white],
                    //   // begin: Alignment.topCenter,
                    //   // end: Alignment.bottomCenter
                    //   // )
                    //       gradient: LinearGradient(colors: [Colors.grey[800]!,Colors.grey[900]!, Colors.grey[800]!,Colors.grey[900]!,],
                    //   begin: Alignment.topLeft,
                    //   end: Alignment.bottomRight

                    //   )
                    //   // image: DecorationImage(
                    //   //   image: const AssetImage('assets/images/bg4.png'),
                    //   //   fit: BoxFit.cover,
                    //   //   colorFilter: ColorFilter.mode(
                    //   //     const Color.fromARGB(255, 137, 229, 141).withOpacity(0.1),
                    //   //     BlendMode.darken,
                    //   //   ),
                    //   // ),
                    // ),
                    child: SingleChildScrollView(
                      child: Stack(children: [
                        Column(
                          children: [
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
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 15),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(color: bordercolor)),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 20),
                                                  child: Container(
                                                    height: 125,
                                                    width: 100,
                                                    decoration: BoxDecoration(
                                                      // shape: BoxShape.circle,
                                                      // borderRadius:
                                                      //     BorderRadius.circular(30),
                                                      border: Border.all(
                                                          color: Colors.green,
                                                          width: 3),
                                                      image: DecorationImage(
                                                        fit: BoxFit.cover,
                                                        image: NetworkImage(
                                                            controller
                                                                .allgetiltpdata!
                                                                .photo),
                                                      ),
                                                    ),
                                                    child: FutureBuilder<void>(
                                                      future: precacheImage(
                                                        NetworkImage(controller
                                                            .allgetiltpdata!
                                                            .photo),
                                                        context,
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
                                                        if (snapshot
                                                                .connectionState ==
                                                            ConnectionState
                                                                .done) {
                                                          // Image is loaded
                                                          return const SizedBox
                                                              .shrink(); // Empty child as the image is already in decoration
                                                        } else if (snapshot
                                                            .hasError) {
                                                          // Error loading image
                                                          return const Icon(
                                                              Icons.error,
                                                              size: 50,
                                                              color:
                                                                  Colors.red);
                                                        } else {
                                                          // Loading indicator
                                                          return const Center(
                                                            child:
                                                                CircularProgressIndicator(),
                                                          );
                                                        }
                                                      },
                                                    ),
                                                  ),
                                                ),
                                                // const SizedBox(
                                                //   height: 10,
                                                // ),
                                                // Padding(
                                                //   padding: const EdgeInsets
                                                //       .symmetric(
                                                //       horizontal: 10),
                                                //   child: Text(
                                                //     "${controller.allgetiltpdata?.name}",
                                                //     style: TextStyle(
                                                //         color: greencol,
                                                //         fontSize: 16,
                                                //         letterSpacing: 5,
                                                //         fontWeight:
                                                //             FontWeight.bold),
                                                //   ),
                                                // ),
                                              ],
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10),
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.all(10),
                                                  margin:
                                                      const EdgeInsets.all(5),
                                                  width: double.maxFinite,
                                                  decoration: BoxDecoration(
                                                      gradient: LinearGradient(
                                                          colors: [
                                                            Colors.orange[900]!
                                                                .withOpacity(
                                                                    0.7),
                                                            Colors.orange
                                                                .withOpacity(
                                                                    0.7)
                                                          ]),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                      color: Colors.blueGrey),
                                                  child: Column(
                                                    children: [
                                                      const Row(
                                                        children: [
                                                          Expanded(
                                                              child: Text(
                                                            "Issued",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 20),
                                                            textAlign: TextAlign
                                                                .center,
                                                          )),
                                                          Expanded(
                                                              child: Text(
                                                            "Upto",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 20),
                                                            textAlign: TextAlign
                                                                .center,
                                                          )),
                                                        ],
                                                      ),
                                                      Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
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
                                                                      TextAlign
                                                                          .center,
                                                                  style: const TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          16),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                          Container(
                                                            alignment: Alignment
                                                                .bottomCenter,
                                                            width: 0.5,
                                                            height: 40,
                                                            margin:
                                                                const EdgeInsets
                                                                    .symmetric(
                                                                    vertical: 8,
                                                                    horizontal:
                                                                        8),
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
                                                                      TextAlign
                                                                          .center,
                                                                  style: const TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          16),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                vertical: 5),
                                                        child:
                                                            LinearPercentIndicator(
                                                          animationDuration:
                                                              300,
                                                          animateToInitialPercent:
                                                              true,
                                                          animation: true,
                                                          lineHeight: 20.0,
                                                          percent: remainingDays(
                                                                  controller
                                                                      .allgetiltpdata!
                                                                      .validDate) /
                                                              validDays(
                                                                  expireddate:
                                                                      controller
                                                                          .allgetiltpdata!
                                                                          .validDate,
                                                                  issuedate: controller
                                                                      .allgetiltpdata!
                                                                      .issueDate), // Pass calculated progress
                                                          backgroundColor:
                                                              Colors.grey[300],
                                                          progressColor:
                                                              Colors.green,
                                                          barRadius:
                                                              const Radius
                                                                  .circular(10),
                                                          center: Text(
                                                            '${remainingDays(controller.allgetiltpdata!.validDate)} days left',
                                                            style:
                                                                const TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      // Padding(
                                                      //   padding:
                                                      //       const EdgeInsets
                                                      //           .symmetric(
                                                      //           horizontal: 16),
                                                      //   child: Row(
                                                      //     mainAxisAlignment:
                                                      //         MainAxisAlignment
                                                      //             .spaceBetween,
                                                      //     children: [
                                                      //       const Text(
                                                      //         "Remaining Days : ",
                                                      //         style: TextStyle(
                                                      //             color: Colors
                                                      //                 .white,
                                                      //             fontSize: 20),
                                                      //         textAlign:
                                                      //             TextAlign
                                                      //                 .center,
                                                      //       ),
                                                      //       Text(
                                                      //         remainingDays(controller
                                                      //                 .allgetiltpdata!
                                                      //                 .validDate)
                                                      //             .toString(),
                                                      //         style: const TextStyle(
                                                      //             color: Colors
                                                      //                 .white,
                                                      //             fontSize: 20),
                                                      //         textAlign:
                                                      //             TextAlign
                                                      //                 .center,
                                                      //       )
                                                      //     ],
                                                      //   ),
                                                      // ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            // Container(
                                            //     padding: const EdgeInsets.all(16),
                                            //     margin: const EdgeInsets.all(16),
                                            //     decoration: BoxDecoration(
                                            //         gradient:
                                            //             LinearGradient(colors: [
                                            //           Colors.orange[900]!
                                            //               .withOpacity(0.7),
                                            //           Colors.orange.withOpacity(0.7)
                                            //         ]),
                                            //         borderRadius:
                                            //             BorderRadius.circular(8),
                                            //         color: Colors.blueGrey),
                                            //     child: Column(
                                            //       children: [
                                            //         const Row(
                                            //           children: [
                                            //             Icon(
                                            //               FontAwesomeIcons
                                            //                   .calendarDays,
                                            //               size: 16,
                                            //               color: Colors.white,
                                            //             ),
                                            //             SizedBox(
                                            //               width: 10,
                                            //             ),
                                            //             Text("Remaining Days",
                                            //                 style: TextStyle(
                                            //                     color: Colors.white,
                                            //                     fontSize: 16)),
                                            //           ],
                                            //         ),
                                            //         Text(
                                            //           remainingDays(controller
                                            //                   .allgetiltpdata!
                                            //                   .validDate)
                                            //               .toString(),
                                            //           style: const TextStyle(
                                            //               color: Colors.white,
                                            //               fontSize: 20),
                                            //           textAlign: TextAlign.center,
                                            //         )
                                            //       ],
                                            //     ))
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Text(
                                            "${controller.allgetiltpdata?.name}",
                                            style: TextStyle(
                                                color: greencol,
                                                fontSize: 16,
                                                letterSpacing: 5,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
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
                              height: 10,
                            ),
                            controller.isscantab
                                ? Container(
                                    padding: const EdgeInsets.all(16),
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 4, horizontal: 16),
                                    width: double.maxFinite,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
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
                                    ))
                                : Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Text(
                                                "Details verified?",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Row(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Radio<String>(
                                                        value: "Yes",
                                                        groupValue: controller
                                                            .selectedOption,
                                                        onChanged: (value) {
                                                          // Handle "Yes" selection
                                                          controller
                                                              .setverifiedoption(
                                                                  name: value!);
                                                        },
                                                      ),
                                                      const Text("Yes"),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Radio<String>(
                                                        value: "No",
                                                        groupValue: controller
                                                            .selectedOption,
                                                        onChanged: (value) {
                                                          // Handle "No" selection
                                                          controller
                                                              .setverifiedoption(
                                                                  name: value!);
                                                        },
                                                      ),
                                                      const Text("No"),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ]),
                                      ),
                                      controller.selectedOption == 'Yes'
                                          ? Column(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 16,
                                                          right: 16,
                                                          top: 5,
                                                          bottom: 15),
                                                  child: Container(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10),
                                                    width: double.maxFinite,
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: Colors.grey),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10)),
                                                    child: Column(
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            const Text(
                                                              'Set Verification Status : ',
                                                              style: TextStyle(
                                                                  fontSize: 16,
                                                                  color: Colors
                                                                      .black,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                            Container(
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                  border: Border.all(
                                                                      color: const Color
                                                                          .fromARGB(
                                                                          255,
                                                                          71,
                                                                          71,
                                                                          71))),
                                                              child:
                                                                  DropdownButton2<
                                                                      String>(
                                                                customButton:
                                                                    SizedBox(
                                                                  width: controller
                                                                              .cardstatusname ==
                                                                          null
                                                                      ? null
                                                                      : 150,
                                                                  child: Center(
                                                                    child: Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceAround,
                                                                      children: [
                                                                        Padding(
                                                                            padding:
                                                                                const EdgeInsets.all(8.0),
                                                                            child: controller.cardstatusname == null
                                                                                ? const Text(
                                                                                    'Select Card Status',
                                                                                    style: TextStyle(color: Colors.grey),
                                                                                  )
                                                                                : Text(controller.cardstatusname!)),
                                                                        const Icon(
                                                                            color: Color.fromARGB(
                                                                                255,
                                                                                62,
                                                                                61,
                                                                                61),
                                                                            Icons.arrow_drop_down)
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                isDense: true,
                                                                dropdownStyleData: DropdownStyleData(
                                                                    decoration: BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                10)),
                                                                    offset:
                                                                        const Offset(
                                                                            0,
                                                                            -4)),
                                                                barrierColor: Colors
                                                                    .transparent,

                                                                style: const TextStyle(
                                                                    color: Colors
                                                                        .black),
                                                                alignment:
                                                                    Alignment
                                                                        .center,

                                                                value: controller
                                                                    .cardstatusname,
                                                                onChanged: (String?
                                                                    newValue) {
                                                                  controller
                                                                      .setcardstatus(
                                                                          name:
                                                                              newValue!);
                                                                },
                                                                items: cardstatus
                                                                    .map((String
                                                                        value) {
                                                                  return DropdownMenuItem<
                                                                      String>(
                                                                    value:
                                                                        value,
                                                                    child: Text(
                                                                      value,
                                                                    ),
                                                                  );
                                                                }).toList(),

                                                                underline:
                                                                    const SizedBox
                                                                        .shrink(), // Removes the underline
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        controller.cardstatusname !=
                                                                null
                                                            ? Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                        top: 10,
                                                                        bottom:
                                                                            5),
                                                                child:
                                                                    ElevatedButton(
                                                                        style: ElevatedButton
                                                                            .styleFrom(
                                                                          shape:
                                                                              RoundedRectangleBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(10),
                                                                          ),
                                                                          minimumSize: const Size(
                                                                              20,
                                                                              40),
                                                                        ),
                                                                        onPressed:
                                                                            () {},
                                                                        child:
                                                                            const Text(
                                                                          'Save',
                                                                          style:
                                                                              TextStyle(color: Colors.white),
                                                                        )),
                                                              )
                                                            : const SizedBox()
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
                                          : const SizedBox(),
                                      Container(
                                        padding: const EdgeInsets.all(16),
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 4, horizontal: 16),
                                        width: double.maxFinite,
                                        decoration: BoxDecoration(
                                            color: Colors.green,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: const Center(
                                          child: Text(
                                            "Verify the details below with the card.",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),

                            Container(
                              // padding: EdgeInsets.all(16),
                              margin: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      blurRadius: 10,
                                      spreadRadius: 5,
                                      offset: const Offset(1, 1),
                                    )
                                  ]),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.person,
                                          size: 18,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          "Personal Details",
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
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
                                    text1: "ID Proof: ",
                                    text2: controller.allgetiltpdata!.idProof,
                                    icon: Icons.badge_outlined,
                                  ),
                                  ProfileUpdate(
                                    text1: "ID No: ",
                                    text2: controller.allgetiltpdata!.idNo,
                                    icon: Icons.badge_rounded,
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
                                    text2:
                                        "${controller.allgetiltpdata!.residingPlace} ${controller.allgetiltpdata?.residingDistrict}",
                                    icon: Icons.location_on,
                                  ),
                                  ProfileUpdate(
                                    text1: "Local Resident: ",
                                    text2: controller
                                        .allgetiltpdata!.localResident,
                                    icon: Icons.place_outlined,
                                  ),
                                  ProfileUpdate(
                                    text1: "Pin Code: ",
                                    text2: controller
                                        .allgetiltpdata!.residingPinCode,
                                    icon: Icons.place_outlined,
                                  ),
                                  ProfileUpdate(
                                    text1: "Purpose: ",
                                    text2:
                                        "${controller.allgetiltpdata!.purposeCategory}-${controller.allgetiltpdata!.purpose}",
                                    icon: Icons.place_outlined,
                                  ),
                                  ProfileUpdate(
                                    text1: "Home State: ",
                                    text2: controller.allgetiltpdata!.state,
                                    icon: Icons.place_outlined,
                                  ),
                                ],
                              ),
                            ),
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
