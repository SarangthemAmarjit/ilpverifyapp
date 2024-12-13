import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../controller/scancontroller.dart';

class ScannedBarcodeLabel extends StatelessWidget {
  const ScannedBarcodeLabel({
    super.key,
    required this.barcodes,
  });

  final Stream<BarcodeCapture> barcodes;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Scancontroller>(
      builder: (scanctrl) {
        return StreamBuilder(
          stream: barcodes,
          builder: (context, snapshot) {
            final scannedBarcodes = snapshot.data?.barcodes ?? [];
              
            if (scannedBarcodes.isEmpty) {
              return const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16,vertical:60),
                child: Text(
                  'Place the QrCode in the Box',
                  overflow: TextOverflow.fade,      
                  style: TextStyle(color: Colors.white,fontSize: 20),
                ),
              );
            }else{
         return Padding(
           padding: const EdgeInsets.symmetric(vertical: 64.0),
           child: Align(
            alignment: Alignment.bottomCenter,
             child: ElevatedButton(
              
              child: Text("Validate"),
             onPressed: (){
              // scanctrl.startQRScan(scannedBarcodes.first.displayValue??"");
             },
             
             
                ),
           ),
         );
            }
   
          },
        );
      }
    );
  }
}