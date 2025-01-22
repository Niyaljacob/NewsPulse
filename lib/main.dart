import 'package:flutter/material.dart';
import 'package:newspulse/view/splashScreen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
       
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen()
    );
  }
}

