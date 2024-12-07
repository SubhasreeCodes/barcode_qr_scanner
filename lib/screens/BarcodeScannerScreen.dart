import 'package:flutter/material.dart';
import 'package:barcode_scan2/barcode_scan2.dart';

class BarcodeScannerScreen extends StatefulWidget {
  @override
  _BarcodeScannerScreenState createState() => _BarcodeScannerScreenState();
}

class _BarcodeScannerScreenState extends State<BarcodeScannerScreen> {
  String _scanResult = 'No result yet';

  Future<void> _scanBarcode() async {
    try {
      var result = await BarcodeScanner.scan();
      if (!mounted) return;
      setState(() {
        _scanResult = result.rawContent.isNotEmpty
            ? result.rawContent
            : 'Scan failed or canceled.';
      });
    } catch (e) {
      setState(() {
        _scanResult = 'Error occurred during scan: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Barcode and QR Scanner'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Scan Result:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              _scanResult, // Show the actual scan result here
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _scanBarcode,
              child: Text("Scan Barcode or QR code"),
            ),
          ],
        ),
      ),
    );
  }
}
