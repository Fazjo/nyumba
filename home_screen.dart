import 'package:flutter/material.dart';
import 'settings_screen.dart';
import 'profile_screen.dart';
import 'sell_house_screen.dart';
import 'login_screen.dart';

class HomeScreen extends StatelessWidget {
  final Function() onToggleTheme;
  final Function(Locale) onLocaleChange;

  const HomeScreen({super.key, required this.onToggleTheme, required this.onLocaleChange});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home', style: Theme.of(context).textTheme.titleLarge),
        leading: IconButton(
          icon: Icon(Icons.settings, color: Theme.of(context).colorScheme.secondary),
          onPressed: () {
            // Navigate to settings screen
            Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsScreen(onToggleTheme: onToggleTheme, onLocaleChange: onLocaleChange)));
          },
        ),
        actions: [
          IconButton(
            icon: const CircleAvatar(
              backgroundImage: AssetImage('assets/user_profile.jpg'), // User profile image
            ),
            onPressed: () {
              _showProfileOptions(context);
            },
          ),
        ],
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: const Column(
        children: [
          // Add other UI components here
        ],
      ),
    );
  }

  void _showProfileOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfileScreen()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Sell My House'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => const SellHouseScreen()));
              },
            ),
          ],
        );
      },
    );
  }
}
