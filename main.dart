import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'models/property.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'screens/home_screen.dart';
import 'screens/property_details_screen.dart';
import 'screens/splash_screen.dart';
import 'screens/welcome_screen.dart';
import 'screens/upload_national_id_screen.dart';
import 'screens/facial_recognition_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/sell_house_screen.dart';
import 'screens/search_screen.dart';  // Ensure this import is correct
import 'app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state?.setLocale(newLocale);
  }

  @override
  Widget build(BuildContext context) {
    return const MyAppBody();
  }
}

class MyAppBody extends StatefulWidget {
  const MyAppBody({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyAppBody> {
  Locale _locale = const Locale('en', 'US');
  bool _isDarkMode = false;

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  void toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeNotifier>(
          create: (_) => ThemeNotifier(),
        ),
      ],
      child: Consumer<ThemeNotifier>(
        builder: (context, theme, child) {
          return MaterialApp(
            title: 'Nyumba',
            theme: _isDarkMode ? ThemeData.dark() : ThemeData.light(),
            locale: _locale,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('en', 'US'),
              Locale('sw', 'TZ'),
            ],
            initialRoute: '/',
            routes: {
              '/': (context) => const SplashScreen(),
              '/welcome': (context) => const WelcomeScreen(),
              '/login': (context) => const LoginScreen(),
              '/register': (context) => const RegisterScreen(),
              '/uploadNationalId': (context) => const UploadNationalIdScreen(),
              '/facialRecognition': (context) => const FacialRecognitionScreen(),
              '/home': (context) => HomeScreen(
                onToggleTheme: toggleTheme,
                onLocaleChange: setLocale,
              ),
              '/search': (context) => const SearchScreen(),
              '/profile': (context) => const ProfileScreen(),
              '/sellHouse': (context) => const SellHouseScreen(),
              '/settings': (context) => SettingsScreen(onToggleTheme: toggleTheme, onLocaleChange: setLocale),
            },
            onGenerateRoute: (settings) {
              if (settings.name == '/propertyDetails') {
                final Property property = settings.arguments as Property;
                return MaterialPageRoute(
                  builder: (context) => PropertyDetailsScreen(property: property),
                );
              }
              return null;
            },
          );
        },
      ),
    );
  }
}

class ThemeNotifier extends ChangeNotifier {
  ThemeData _themeData;

  ThemeNotifier() : _themeData = ThemeData.light();

  ThemeData getTheme() => _themeData;

  void setDarkMode() {
    _themeData = ThemeData.dark();
    notifyListeners();
  }

  void setLightMode() {
    _themeData = ThemeData.light();
    notifyListeners();
  }
}
