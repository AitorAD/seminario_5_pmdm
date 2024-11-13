import 'package:flutter/material.dart';
import 'package:seminario_5/screens/home_screen.dart';
import 'package:seminario_5/screens/settings_screen.dart';
import 'package:seminario_5/shared_prefs/user_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new UserPreferences();
  await prefs.initPrefs();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Preferencias',
      routes: {
        HomeScreen.routeName: (_) => HomeScreen(),
        SettingsScreen.routeName: (_) => SettingsScreen(),
      },
      initialRoute: HomeScreen.routeName,
    );
  }
}
