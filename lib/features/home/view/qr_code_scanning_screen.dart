import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QrCodeScanningScreen extends StatefulWidget {
  const QrCodeScanningScreen({super.key});

  static final String name = '/qrCode-scanning-screen';

  @override
  State<QrCodeScanningScreen> createState() => _QrCodeScanningScreenState();
}

class _QrCodeScanningScreenState extends State<QrCodeScanningScreen> {
  String? scannedData;
  final double boxSize = 220; // Center Box Size
  final GlobalKey scannerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:  IconButton(onPressed: ()=>Navigator.pop(context) , icon: Icon(Icons.arrow_back)),
        title: const Text("scan qr code", style: TextStyle(color: Colors.blue)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white, // পুরো Screen সাদা
      body: Stack(
        alignment: Alignment.center,
        children: [
          /// 🔹 Scanner
          MobileScanner(
            key: scannerKey,
            fit: BoxFit.cover,
            onDetect: (capture) {
              for (final barcode in capture.barcodes) {
                if (barcode.format == BarcodeFormat.qrCode) {
                  // bounding box / corners check
                  final corners = barcode.corners; // List<Offset>?
                  if (corners != null && corners.isNotEmpty) {
                    // Approximate bounding box from corners
                    final left = corners.map((e) => e.dx).reduce((a, b) => a < b ? a : b);
                    final right = corners.map((e) => e.dx).reduce((a, b) => a > b ? a : b);
                    final top = corners.map((e) => e.dy).reduce((a, b) => a < b ? a : b);
                    final bottom = corners.map((e) => e.dy).reduce((a, b) => a > b ? a : b);

                    final screenSize = MediaQuery.of(context).size;
                    final centerX = screenSize.width / 2;
                    final centerY = screenSize.height / 2;
                    const boxSize = 220.0;

                    final boxLeft = centerX - boxSize / 2;
                    final boxTop = centerY - boxSize / 2;
                    final boxRight = centerX + boxSize / 2;
                    final boxBottom = centerY + boxSize / 2;

                    if (left >= boxLeft &&
                        top >= boxTop &&
                        right <= boxRight &&
                        bottom <= boxBottom) {
                      debugPrint("✅ QR inside box: ${barcode.rawValue}");
                    } else {
                      debugPrint("⚠️ QR outside box");
                    }
                  }
                }
              }
            },

          ),

          /// 🔹 Center Box UI
          Container(
            width: boxSize,
            height: boxSize,
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(
                color: Colors.black,
                width: 3,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ],
      ),
    );
  }
}
