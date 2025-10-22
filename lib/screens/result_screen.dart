import 'package:flutter/material.dart';
import 'package:ocr_sederhana/screens/home_screen.dart';

class ResultScreen extends StatelessWidget {
  final String ocrText;

  const ResultScreen({super.key, required this.ocrText});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hasil OCR')),

      body: Padding(
        padding: const EdgeInsets.all(16.0),

        child: SingleChildScrollView(
          child: SelectableText(
            ocrText.isEmpty ? 'Tidak ada teks ditemukan.' : ocrText,
            style: const TextStyle(fontSize: 18),
          ),
        ),
      ),

      // floatingActionButton untuk home
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => const HomeScreen()),
            (route) => false,
          );
        },
        child: const Icon(Icons.home),
        tooltip: 'Kembali ke Beranda',
      ),
    );
  }
}
