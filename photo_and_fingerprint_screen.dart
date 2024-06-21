import 'package:flutter/material.dart';

class PhotoAndFingerprintScreen extends StatefulWidget {
  const PhotoAndFingerprintScreen({super.key});

  @override
  _PhotoAndFingerprintScreenState createState() => _PhotoAndFingerprintScreenState();
}

class _PhotoAndFingerprintScreenState extends State<PhotoAndFingerprintScreen> {
  void _finish() {
    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Photo and Fingerprint')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text('Capture your photo and fingerprints'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _finish,
              child: const Text('Finish'),
            ),
          ],
        ),
      ),
    );
  }
}
