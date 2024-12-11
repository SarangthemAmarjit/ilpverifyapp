import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ilpverifyapp/controller/scancontroller.dart';
import 'package:mobile_scanner/mobile_scanner.dart';


import 'scanner_barcode_label.dart';
import 'scanner_button_widgets.dart';
import 'scanner_error_widget.dart';

class BarcodeScannerWithOverlay extends StatefulWidget {
  const BarcodeScannerWithOverlay({super.key});

  @override
  _BarcodeScannerWithOverlayState createState() =>
      _BarcodeScannerWithOverlayState();
}

class _BarcodeScannerWithOverlayState extends State<BarcodeScannerWithOverlay> {
  // final MobileScannerController controller = MobileScannerController(
  //   formats: const [BarcodeFormat.qrCode],
  // 

  @override
  Widget build(BuildContext context) {
    final scanWindow = Rect.fromCenter(
      center: MediaQuery.sizeOf(context).center(Offset.zero),
      width: 200,
      height: 200,
    );

    return GetBuilder<Scancontroller>(
      builder: (scanctrl) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          
          body:scanctrl.controller==null?const Center(child: CircularProgressIndicator()) : SafeArea(
            child: Stack(
              fit: StackFit.expand,
              children: [
                Positioned.fill(
                  child: MobileScanner(
                    fit: BoxFit.contain,
                    controller: scanctrl.controller,
                    scanWindow: scanWindow,
                    errorBuilder: (context, error, child) {
                      return ScannerErrorWidget(error: error);
                    },
                    overlayBuilder: (context, constraints) {
                      return Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: ScannedBarcodeLabel(barcodes: scanctrl.controller!.barcodes),
                        ),
                      );
                    },
                  ),
                ),
                ValueListenableBuilder(
                  valueListenable: scanctrl.controller!,
                  builder: (context, value, child) {
                    if (!value.isInitialized ||
                        !value.isRunning ||
                        value.error != null) {
                      return const SizedBox();
                    }
            
                    return CustomPaint(
                      painter: ScannerOverlay(scanWindow: scanWindow),
                    );
                  },
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ToggleFlashlightButton(controller:scanctrl.controller!),
                        SwitchCameraButton(controller: scanctrl.controller!),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }
    );
  }

  @override
  Future<void> dispose() async {
    Get.find<Scancontroller>().disposeController();
    super.dispose();
   
  }
}

class ScannerOverlay extends CustomPainter {
  const ScannerOverlay({
    required this.scanWindow,
    this.borderRadius = 12.0,
  });

  final Rect scanWindow;
  final double borderRadius;

  @override
  void paint(Canvas canvas, Size size) {
    // we need to pass the size to the custom paint widget
    final backgroundPath = Path()
      ..addRect(Rect.fromLTWH(0, 0, size.width, size.height));

    final cutoutPath = Path()
      ..addRRect(
        RRect.fromRectAndCorners(
          scanWindow,
          topLeft: Radius.circular(borderRadius),
          topRight: Radius.circular(borderRadius),
          bottomLeft: Radius.circular(borderRadius),
          bottomRight: Radius.circular(borderRadius),
        ),
      );

    final backgroundPaint = Paint()
      ..color = Colors.black.withOpacity(0.5)
      ..style = PaintingStyle.fill
      ..blendMode = BlendMode.dstOver;

    final backgroundWithCutout = Path.combine(
      PathOperation.difference,
      backgroundPath,
      cutoutPath,
    );

    final borderPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.0;

    final borderRect = RRect.fromRectAndCorners(
      scanWindow,
      topLeft: Radius.circular(borderRadius),
      topRight: Radius.circular(borderRadius),
      bottomLeft: Radius.circular(borderRadius),
      bottomRight: Radius.circular(borderRadius),
    );

    // First, draw the background,
    // with a cutout area that is a bit larger than the scan window.
    // Finally, draw the scan window itself.
    canvas.drawPath(backgroundWithCutout, backgroundPaint);
    canvas.drawRRect(borderRect, borderPaint);
  }

  @override
  bool shouldRepaint(ScannerOverlay oldDelegate) {
    return scanWindow != oldDelegate.scanWindow ||
        borderRadius != oldDelegate.borderRadius;
  }
}