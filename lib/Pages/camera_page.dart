import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:plant_app/Pages/camera_overlay.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  @override
  void dispose() {
    cameraController.dispose();
    super.dispose();
  }

  MobileScannerController cameraController = MobileScannerController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          MobileScanner(
            controller: cameraController,
            onDetect: (barcode) {
              debugPrint('Barcode found! ${barcode.raw}');
            },
          ),
          QRScannerOverlay(
            overlayColor: Colors.black.withOpacity(0.5),
          ),
        ],
      ),
    );
  }
}
