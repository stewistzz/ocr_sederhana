import 'package:flutter/material.dart';

import 'scan_screen.dart';

// import 'package:flutter_ocr_sederhana/screens/scan_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Menu Utama')),

      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,

              MaterialPageRoute(builder: (_) => ScanScreen()),
            );
          },

          child: const Text('Mulai Scan Teks'),
        ),
      ),
    );
  }
}
