import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:ocr_sederhana/screens/home_screen.dart';

class ResultScreen extends StatefulWidget {
  // ubah menjadi statefulwidget
  final String ocrText;

  const ResultScreen({super.key, required this.ocrText});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  late String ocrText; // variabel untuk menyimpan teks OCR
  late FlutterTts flutterTts; // inisialisasi flutter tts

  // inisialisasi initstate()
  @override
  void initState() {
    super.initState();
    ocrText = widget.ocrText; // mengambil teks OCR dari widget

    // inisialisasi flutter tts
    flutterTts = FlutterTts();
    // mengatur bahasa ke indonesia
    flutterTts.setLanguage("id-ID");
  }

  // implementasi dispose
  @override
  void dispose() {
    flutterTts.stop(); // menghentikan text to speech saat dispose
    super.dispose();
  }

  // function speak
  Future<void> _speak(String text) async {
    if (text.isNotEmpty) {
      await flutterTts.speak(text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text('Hasil OCR')), // menghilangkan appbar
      appBar: AppBar(
        // memodifikasi appbar dengan menambahkan action button
        title: const Text('Hasil OCR'),
        actions: [
          IconButton(
            icon: const Icon(Icons.volume_up),
            tooltip: 'Bacakan Teks',
            onPressed: () {
              _speak(ocrText); // memanggil fungsi speakText
            },
          ),
        ],
      ),

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
