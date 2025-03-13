import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Trash Panda'),
      ),
      body: const Center(
        child: Text(
          'Welcome to the trash panda app!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}