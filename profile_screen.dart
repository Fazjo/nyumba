import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileScreen extends StatelessWidget {
  final String username = 'John Doe';
  final String email = 'john.doe@example.com';
  final String phoneNumber = '+1234567890';

  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile', style: Theme.of(context).textTheme.titleLarge),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/user_profile.jpg'),
            ),
            const SizedBox(height: 16),
            Text(username, style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: () {
                _launchEmail(email);
              },
              child: Text(email, style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.blue)),
            ),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: () {
                _launchPhone(phoneNumber);
              },
              child: Text(phoneNumber, style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.blue)),
            ),
          ],
        ),
      ),
    );
  }

  void _launchEmail(String email) async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: email,
    );
    var url = params.toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _launchPhone(String phoneNumber) async {
    final Uri params = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    var url = params.toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
