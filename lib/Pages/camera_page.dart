import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:plant_app/Pages/camera_overlay.dart';
import 'package:plant_app/consts/constants.dart';

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
          Positioned(
            top: 50,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Constants.primaryColor.withOpacity(0.15),
                  ),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.close,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Constants.primaryColor.withOpacity(0.15),
                  ),
                  child: IconButton(
                    onPressed: () => cameraController.toggleTorch,
                    icon: cameraController.torchEnabled
                        ? const Icon(
                            Icons.flash_off,
                            color: Colors.white,
                          )
                        : const Icon(
                            Icons.flash_on,
                            color: Colors.yellow,
                          ),
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
