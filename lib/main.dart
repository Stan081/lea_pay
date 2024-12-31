import 'package:flutter/material.dart';
import 'package:lea_pay/screens/splash_screen.dart';

void main() {
  runApp(const LeaPay());
}

class LeaPay extends StatelessWidget {
  const LeaPay({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lea Pay',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xff004D43),
          primary: Colors.white,
          secondary: Colors.white,
        ),
        textTheme: const TextTheme(),
        useMaterial3: true,
        fontFamily: 'Poppins',
      ),
      home: const SplashScreen(),
    );
  }
}
