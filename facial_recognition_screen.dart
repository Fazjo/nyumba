import 'package:flutter/material.dart';

class FacialRecognitionScreen extends StatefulWidget {
  const FacialRecognitionScreen({super.key});

  @override
  FacialRecognitionScreenState createState() => FacialRecognitionScreenState();
}

class FacialRecognitionScreenState extends State<FacialRecognitionScreen> {
  void _completeRegister() {
    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Facial Recognition and Fingerprint')),
      body: Center(
        child: ElevatedButton(
          onPressed: _completeRegister,
          child: const Text('Complete Registration'),
        ),
      ),
    );
  }
}
