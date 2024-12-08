import 'dart:developer';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:ilpverifyapp/model/ilpmodel.dart';
import 'package:ilpverifyapp/model/scannermodel.dart';

class Scancontroller extends GetxController {
  IlPmodel? alldata;
  // Scanned data
  var scannedModel = Rxn<QrScannerModel>();

  bool isSameDate(DateTime? date1, DateTime? date2) {
    if (date1 == null || date2 == null) return false;
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  void getiilpdata({required String permitnum}) async {
    try {
      final response = await http.get(Uri.parse(
          'https://manipurilponline.mn.gov.in/api/permit/$permitnum'));

      if (response.statusCode == 200) {
        print(response.body);

        alldata = ilPmodelFromJson(
            response.body); // Assuming this function is parsing the response

        if (scannedModel.value!.applicantName == alldata!.name &&
            scannedModel.value!.idNo == alldata!.idNo &&
            isSameDate(scannedModel.value!.dateOfIssue, alldata!.issueDate) &&
            isSameDate(scannedModel.value!.validUpto, alldata!.validDate)) {
          log('Valided');
        } else {
          log('FAke ID Card Found');
        }
        log("Name : ${alldata!.name}");
      } else {
        print('Failed to load data: ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Error occurred: $e');
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
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

    if (barcodeScanRes.isNotEmpty && barcodeScanRes != '-1') {
      // Ensure it's not canceled
      try {
        // Parse the JSON data into QrScannerModel
        final parsedData = qrScannerModelFromJson(barcodeScanRes);
        scannedModel.value = parsedData; // Update the scanned data
        log(scannedModel.value!.permitNo);
        getiilpdata(permitnum: scannedModel.value!.permitNo);
//Get location and make post request to server
        var loc = await getlocation();
        log(loc.toString());
// location, permet num, datetime.now
      } catch (e) {
        log(e.toString());
        Get.snackbar(
          "Invalid Data",
          "The scanned QR code contains invalid data.",
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    }
  }

  Future<String> getlocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    Position position = await Geolocator.getCurrentPosition(
      locationSettings: AndroidSettings(
          forceLocationManager: true, accuracy: LocationAccuracy.best),
    );

    final gpsCoordinates =
        'Lat: ${(position.latitude.toStringAsFixed(4))}, Lon: ${(position.longitude.toStringAsFixed(4))}';

    update();

    return gpsCoordinates;
  }
}
