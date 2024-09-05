import 'package:flutter/material.dart';
import 'package:plant_app/Pages/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Directionality(
      /*
      for persian language
       */
      textDirection: TextDirection.rtl,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Plant App',
        home: SplashScreen(),
      ),
    );
  }
}
