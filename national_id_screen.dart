import 'package:flutter/material.dart';

class NationalIdScreen extends StatefulWidget {
  const NationalIdScreen({super.key});

  @override
  _NationalIdScreenState createState() => _NationalIdScreenState();
}

class _NationalIdScreenState extends State<NationalIdScreen> {
  final TextEditingController _nationalIdController = TextEditingController();

  void _next() {
    Navigator.pushReplacementNamed(context, '/photo_and_fingerprint');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('National ID')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nationalIdController,
              decoration: const InputDecoration(labelText: 'National ID'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _next,
              child: const Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}
