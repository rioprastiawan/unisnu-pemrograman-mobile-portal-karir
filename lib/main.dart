import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const PortalKarirApp());
}

class PortalKarirApp extends StatelessWidget {
  const PortalKarirApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portal Karir',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
