import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_mlkit_barcode_scanning/google_mlkit_barcode_scanning.dart';
import 'package:image_picker/image_picker.dart';

class ScanQrCode extends StatefulWidget {
  const ScanQrCode({super.key});

  @override
  State<ScanQrCode> createState() => _ScanQrCodeState();
}

class _ScanQrCodeState extends State<ScanQrCode> {
  bool isScanned = false;
  final MobileScannerController controller = MobileScannerController();

  void _handleBarcode(String code) async {
    if (isScanned) return;
    setState(() => isScanned = true);

    debugPrint('Scanned: $code');

    if (code.startsWith('upi://')) {
      if (await canLaunchUrl(Uri.parse(code))) {
        await launchUrl(Uri.parse(code), mode: LaunchMode.externalApplication);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Unable to launch UPI link')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Scanned: $code')),
      );
    }

    await Future.delayed(Duration(seconds: 3));
    setState(() => isScanned = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('QR Code Scanner')),
      body: MobileScanner(
        controller: controller,
        onDetect: (capture) {
          for (final barcode in capture.barcodes) {
            final String? code = barcode.rawValue;
            if (code != null && code.isNotEmpty) {
              _handleBarcode(code);
              break;
            }
          }
        },
      ),
    );
  }
}



class ScanFromGallery extends StatefulWidget {
  const ScanFromGallery({super.key});

  @override
  State<ScanFromGallery> createState() => _ScanFromGalleryState();
}

class _ScanFromGalleryState extends State<ScanFromGallery> {
  String result = 'No data scanned yet';

  Future<void> pickAndScanImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile == null) return;

    final barcodeScanner = BarcodeScanner();
    final inputImage = InputImage.fromFilePath(pickedFile.path);
    final barcodes = await barcodeScanner.processImage(inputImage);

    for (final barcode in barcodes) {
      final String? rawValue = barcode.rawValue;
      if (rawValue != null) {
        setState(() {
          result = rawValue;
        });
      }
    }

    await barcodeScanner.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        title: Text(
          'Scan from Gallery',
          style: TextStyle(color: Colors.blue[400]),
        ),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Show styled result card if result is available
              if (result != 'No data scanned yet')
                Card(
                  elevation: 5,
                  margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  color: Colors.blue.shade50,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        const Text(
                          'Scanned Result:',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueAccent,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          result,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

              const SizedBox(height: 30),

              // Pick QR image from gallery button
              ElevatedButton.icon(
                onPressed: pickAndScanImage,
                icon: const Icon(Icons.image_search),
                label: const Text('Pick QR Image from Gallery'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  textStyle: const TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
