import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  final Function() onToggleTheme;
  final Function(Locale) onLocaleChange;

  const SettingsScreen({super.key, required this.onToggleTheme, required this.onLocaleChange});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings', style: Theme.of(context).textTheme.titleLarge),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Theme'),
            trailing: Switch(
              value: Theme.of(context).brightness == Brightness.dark,
              onChanged: (value) {
                onToggleTheme();
              },
            ),
          ),
          ListTile(
            title: const Text('Language'),
            trailing: DropdownButton<Locale>(
              value: Localizations.localeOf(context),
              onChanged: (Locale? newLocale) {
                if (newLocale != null) {
                  onLocaleChange(newLocale);
                }
              },
              items: const [
                DropdownMenuItem<Locale>(
                  value: Locale('en', 'US'),
                  child: Text('English'),
                ),
                DropdownMenuItem<Locale>(
                  value: Locale('sw', 'TZ'),
                  child: Text('Swahili'),
                ),
              ],
            ),
          ),
          ListTile(
            title: const Text('Calculator'),
            onTap: () {
              // Navigate to calculator screen
            },
          ),
          ListTile(
            title: const Text('Feedback'),
            onTap: () {
              // Navigate to feedback screen
            },
          ),
          ListTile(
            title: const Text('Privacy and Data'),
            onTap: () {
              // Navigate to privacy and data screen
            },
          ),
          ListTile(
            title: const Text('Terms of Use'),
            onTap: () {
              // Navigate to terms of use screen
            },
          ),
          ListTile(
            title: const Text('Payments'),
            onTap: () {
              // Navigate to payments screen
            },
          ),
        ],
      ),
    );
  }
}
