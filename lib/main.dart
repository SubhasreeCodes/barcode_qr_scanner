import 'package:flutter/material.dart';
import 'package:flutter_barcode_qr_scanner/screens/BarcodeScannerScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:
      BarcodeScannerScreen(), // Use the correct name of the screen
    );
  }
}
