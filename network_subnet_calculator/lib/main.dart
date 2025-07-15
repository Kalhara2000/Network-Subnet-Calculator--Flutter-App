import 'package:flutter/material.dart';
import 'network_calc_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Network Subnet Calculator',
      themeMode: ThemeMode.system,
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      home: const NetworkCalcScreen(),
    );
  }
}

class AppThemes {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.blue.shade700,
    scaffoldBackgroundColor: Colors.lightBlue.shade50,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.blue.shade700,
      centerTitle: true,
    ),
    colorScheme: ColorScheme.light(
      primary: Colors.blue.shade700,
      onPrimary: Colors.white,
    ),
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.blue.shade700,
    scaffoldBackgroundColor: Colors.blueGrey.shade900,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.blue.shade700,
      centerTitle: true,
    ),
    colorScheme: ColorScheme.dark(
      primary: Colors.blue.shade700,
      onPrimary: Colors.white,
    ),
  );
}
