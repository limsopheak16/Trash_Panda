import 'package:flutter/material.dart';
import 'package:trash_panda/views/login.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Login()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Background Circles
          Positioned(
            top: -250,
            right: -250,
            child: Container(
              width: 500,
              height: 500,
              decoration: const BoxDecoration(
                color: Color(0xFF80AF81),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            bottom: -250,
            left: -250,
            child: Container(
              width: 500,
              height: 500,
              decoration: const BoxDecoration(
                color: Color(0xFF80AF81),
                shape: BoxShape.circle,
              ),
            ),
          ),

          // Center Content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Title
                const Text(
                  'Waste-to-Wealth\nCollector !!',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Color(0xFF058B09)),
                ),

                const SizedBox(height: 6),

                // Subtitle
                const Text(
                  'Give it to us',
                  style: TextStyle(fontSize: 22, color: Color(0xFF058B09), fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 30),

                // Image
                Image.asset(
                  'assets/icons/panda.jpg',
                  width: 250,
                  height: 250,
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
