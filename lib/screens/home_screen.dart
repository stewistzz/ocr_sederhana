import 'package:flutter/material.dart';

import 'scan_screen.dart';

// import 'package:flutter_ocr_sederhana/screens/scan_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Menu Utama OCR_2341760188')),
      body: Center(
        // mengubah menjadi listile
        child: ListTile(
          leading: const Icon(Icons.camera_alt, color: Colors.blue),
          title: const Text('Mulai Pindai Teks Baru'),
          onTap: () {
            // menggunakan navigator push
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => ScanScreen()),
            );
          },
        ),
      ),
    );
  }
}
