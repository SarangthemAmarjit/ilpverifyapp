import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:ilpverifyapp/pages/applicantprofile.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:ilpverifyapp/model/ilpmodel.dart';
import 'package:ilpverifyapp/model/scannermodel.dart';

import '../config/apis.dart';

class Scancontroller extends GetxController {
  IlPmodel? allgetiltpdata;
  final permitController = TextEditingController();

  bool _isvalided = false;
  bool get isvalided => _isvalided;

  bool _isverifybuttonpress = false;
  bool get isverifybuttonpress => _isverifybuttonpress;
  bool _isfake = false;
  bool get isfake => _isfake;
  // Scanned data
  QrScannerModel? scannedModel;
 bool serviceEnabled = false;
  RxString locationStatus = ''.obs; // Observable to track location status
  @override
  void onInit() {
    super.onInit();
    checkLocationPermission(); // Call permission check when the controller initializes


  }

  bool isSameDate(DateTime? date1, DateTime? date2) {
    if (date1 == null || date2 == null) return false;
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }


  void verifyiilpdata() async {
    _isverifybuttonpress = true;
    update();
    try {
      final response = await http.get(Uri.parse(
          '$permitapi${permitController.text}'));

      if (response.statusCode == 200) {
        print(response.body);

        allgetiltpdata = ilPmodelFromJson(
            response.body); // Assuming this function is parsing the response

        if (scannedModel!.applicantName == allgetiltpdata!.name &&
            scannedModel!.idNo == allgetiltpdata!.idNo &&
            isSameDate(scannedModel!.dateOfIssue, allgetiltpdata!.issueDate) &&
            isSameDate(scannedModel!.validUpto, allgetiltpdata!.validDate)) {
          log('Valided');
          _isfake = false;
          _isvalided = true;
          update();
        } else {
          _isfake = true;
          _isvalided = false;
          update();
        }
        log("Name : ${allgetiltpdata!.name}");
        _isverifybuttonpress = false;
        update();
        Get.to(const ApplicantProfile());
      } else {
        _isverifybuttonpress = false;
        update();

        print('Failed to load data: ${response.reasonPhrase}');
        Get.snackbar("Error", "Invalid Permit Number.",
            backgroundColor: const Color.fromARGB(255, 233, 92, 92),colorText: Colors.white,
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      _isverifybuttonpress = false;
      update();
      print('Error occurred: $e');
      Get.snackbar("Error", "Server Problem.",
          backgroundColor: const Color.fromARGB(255, 233, 92, 92),
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<bool> getiilpdata({required String permitnum}) async {
    try {
      final response = await http.get(Uri.parse(
          'https://manipurilponline.mn.gov.in/api/permit/$permitnum'));

      if (response.statusCode == 200) {
        print(response.body);

        allgetiltpdata = ilPmodelFromJson(
            response.body); // Assuming this function is parsing the response

        if (scannedModel!.applicantName == allgetiltpdata!.name &&
            scannedModel!.idNo == allgetiltpdata!.idNo &&
            isSameDate(scannedModel!.dateOfIssue, allgetiltpdata!.issueDate) &&
            isSameDate(scannedModel!.validUpto, allgetiltpdata!.validDate)) {
          log('Valided');
          _isfake = false;
          _isvalided = true;
          update();
        } else {
          _isfake = true;
          _isvalided = false;
          update();
        }
        log("Name : ${allgetiltpdata!.name}");
        return true;
      } else {
        print('Failed to load data: ${response.reasonPhrase}');
        Get.snackbar("Error", "Invalid Permit Number.",
            backgroundColor: const Color.fromARGB(255, 233, 92, 92),colorText: Colors.white,
            snackPosition: SnackPosition.BOTTOM);
        return false;
      }
    } catch (e) {
      print('Error occurred: $e');
      Get.snackbar("Error", "$e.",
          backgroundColor: const Color.fromARGB(255, 233, 92, 92),colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM);
      return false;
    }
  }

  // Method to start QR scan
  Future<void> startQRScan() async {
    String barcodeScanRes;

    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        
        '#ff6666', // Scanner overlay color
        'Cancel', // Cancel button text
        true, // Show flash icon
        ScanMode.QR, // Set scan mode to QR
      );
    } on PlatformException {
      barcodeScanRes = 'Failed to start QR scanner.';
      Get.snackbar("Error", "Failed to start QR scanner.",
          backgroundColor: const Color.fromARGB(255, 233, 92, 92),colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

    if (barcodeScanRes.isNotEmpty && barcodeScanRes != '-1') {
      // Ensure it's not canceled
      try {
        // Parse the JSON data into QrScannerModel
        
        final parsedData = qrScannerModelFromJson(barcodeScanRes);
        
        scannedModel = parsedData; // Update the scanned data
        print(scannedModel?.toJson().toString()??"");
        update();
        log(scannedModel!.permitNo);
        var ispermitnumvalided =
            await getiilpdata(permitnum: scannedModel!.permitNo);
        if (ispermitnumvalided) {
          Get.to(()=>const ApplicantProfile());
        } else {
          Get.snackbar("Error", "Invalid Permit Number.",
              backgroundColor: const Color.fromARGB(255, 233, 92, 92),colorText: Colors.white,
              snackPosition: SnackPosition.BOTTOM);
        }

//Get location and make post request to server
        // String? loc = await getLocation();
        // log(loc.toString());
// location, permet num, datetime.now
      } catch (e) {
        log( "log in scanner: ${e.toString()}");
        Get.snackbar(
          backgroundColor: const Color.fromARGB(255, 233, 92, 92),colorText: Colors.white
          ,
          "Invalid Data",
          "The scanned QR code contains invalid data.",
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    }
  }

  Future<void> checkLocationPermission() async {
   
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      locationStatus.value = 'Location services are disabled.';
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        locationStatus.value = 'Location permissions are denied.';
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      locationStatus.value =
          'Location permissions are permanently denied, we cannot request permissions.';
      return;
    }

    locationStatus.value = 'Location permissions granted.';
    update();
  }

  Future<String?> getLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        locationSettings: AndroidSettings(
            forceLocationManager: true, accuracy: LocationAccuracy.best),
      );

      final gpsCoordinates =
          'Lat: ${(position.latitude.toStringAsFixed(4))}, Lon: ${(position.longitude.toStringAsFixed(4))}';

      return gpsCoordinates;
    } catch (e) {
      // return Future.error(e.toString()
      // );
      return null;
    }
  }

  String formatDateWithSuffix(DateTime date) {
    final day = date.day;
    final month = DateFormat.MMM().format(date); // Short month name
    final year = date.year;

    // Add suffix for the day (st, nd, rd, th)
    String suffix;
    if (day % 10 == 1 && day != 11) {
      suffix = 'st';
    } else if (day % 10 == 2 && day != 12) {
      suffix = 'nd';
    } else if (day % 10 == 3 && day != 13) {
      suffix = 'rd';
    } else {
      suffix = 'th';
    }

    // Combine into the desired format
    return "$day$suffix $month $year";
  }
}
