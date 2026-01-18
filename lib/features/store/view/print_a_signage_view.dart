import 'dart:typed_data';

import 'package:cenith_marchent/core/utils/custom_snackbar.dart';
import 'package:cenith_marchent/features/store/view_model/print_a_signage_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:screenshot/screenshot.dart';

class PrintASignageView extends StatefulWidget {
  const PrintASignageView({super.key});

  static final String name = 'print-a-signage-view';

  @override
  State<PrintASignageView> createState() => _PrintASignageViewState();
}

class _PrintASignageViewState extends State<PrintASignageView> {
  final ScreenshotController _screenshotController = ScreenshotController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      // --- Updated AppBar ---
      appBar: AppBar(
        title: const Text(
          "Print Signage",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: buildSignage(),
                ),
              ),
            ),
          ),

          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  offset: Offset(0, -2),
                ),
              ],
            ),
            child: SafeArea(
              child: ElevatedButton(
                onPressed: () {
                  printSignage();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF3498db),
                  minimumSize: const Size(double.infinity, 55),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.print, color: Colors.white),
                    SizedBox(width: 10),
                    Text(
                      "Print Signage",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSignage() {
    return Container(
      width: 350,
      height: 520,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF3498db), Color(0xFF1abc9c)],
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          storeNameandSiteSection(),
          const SizedBox(height: 25),
          descriptionSection(),
          const SizedBox(height: 15),
          const Text(
            "SCAN QR CODE TO BOOK IT",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 10),
          qrCodeSection(), // Method name fix korechi
          const Spacer(),
          // Footer
          const Text(
            "DOWNLOAD THE APP",
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            "RADICAL - LUGGAGE STORAGE",
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              _buildStoreButton(Icons.apple, "App Store"),
              const SizedBox(width: 10),
              _buildStoreButton(Icons.play_arrow, "Google Play"),
            ],
          ),
        ],
      ),
    );
  }

  // --- UI Methods ---

  Widget qrCodeSection() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Icon(Icons.qr_code_2, size: 110, color: Colors.black),
        ),
        const SizedBox(width: 15),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildFeatureRow(
                Icons.star_outline,
                "over 2 Million bags\nsafely stored",
              ),
              const SizedBox(height: 12),
              _buildFeatureRow(
                Icons.star_outline,
                "Luggage guarantee\nof \$,€,£ 3,000",
              ),
              const SizedBox(height: 12),
              _buildFeatureRow(Icons.star_outline, "24/7 instant\nsupport"),
            ],
          ),
        ),
      ],
    );
  }

  Row descriptionSection() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Expanded(
          child: Text(
            "STORE\nYOUR\nLUGGAGE\nHERE",
            style: TextStyle(
              color: Colors.white,
              fontSize: 36,
              fontWeight: FontWeight.w900,
              height: 1.1,
            ),
          ),
        ),
        Opacity(
          opacity: 0.3,
          child: const Icon(
            Icons.shopping_bag_outlined,
            size: 90,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Row storeNameandSiteSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Icon(Icons.luggage, color: Colors.white, size: 22),
            const SizedBox(width: 8),
            const Text(
              "Radical Storage",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
        const Text(
          "radicalstorage.com",
          style: TextStyle(color: Colors.white70, fontSize: 10),
        ),
      ],
    );
  }

  Widget _buildFeatureRow(IconData icon, String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: Colors.white, size: 16),
        const SizedBox(width: 6),
        Flexible(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 11,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStoreButton(IconData icon, String store) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.white, size: 16),
          const SizedBox(width: 6),
          Text(
            store,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  void printSignage() async {
    try {
      Uint8List? image = await Get.find<PrintASignageViewModel>()
          .takeScreenShoot(
            controller: _screenshotController,
            widget: buildSignage(),
          );

      if (image != null) {
        await Get.find<PrintASignageViewModel>().printPdf(image);
      }
    } catch (e) {
      if (!mounted) return;
      customSnackBar(
        context: context,
        title: 'Something went wrong, please try again later',
      );
    }
  }
}
