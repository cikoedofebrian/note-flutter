import 'dart:async';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3),
        (() => Navigator.pushReplacementNamed(context, '/home')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text(
          'Notec',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
    );
  }
}
