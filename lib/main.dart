import 'package:flutter/material.dart';
import 'widgets/hero.dart';
import 'widgets/band.dart';
import 'widgets/music.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music App',
      theme: ThemeData(
        primarySwatch: Colors.red,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              HeroSection(),
              SizedBox(height: 30),
              BandOfTheDaySection(),
              SizedBox(height: 30),
              MusicOfTheDaySection(),
            ],
          ),
        ),
      ),
    );
  }
}