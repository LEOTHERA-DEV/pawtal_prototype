import 'package:flutter/material.dart';
import 'package:pawtal/screens/home_screen.dart';
import 'package:pawtal/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PetCare Dex',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.getTheme(),
      home: const HomeScreen(),
    );
  }
}
