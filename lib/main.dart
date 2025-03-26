import 'package:flutter/material.dart';
import 'package:trash_panda/views/home.dart';
import 'package:trash_panda/views/splash.dart';
import 'package:trash_panda/views/login.dart';
import 'package:trash_panda/views/register.dart';
import "package:trash_panda/views/Recent_all.dart";
import "package:trash_panda/views/history.dart";
import "package:trash_panda/views/detailsocial.dart";
import "package:trash_panda/views/social.dart";
import "package:trash_panda/views/profile.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Poppins'),
      initialRoute: '/splash', 
      routes: {
        '/': (context) => HomePage(), 
        '/splash': (context) => Splash(),   
        '/login': (context) => Login(),
        '/register': (context) => SignUp(),
        '/recent': (context) => RecentActivities(),
        '/history': (context) => ScheduledPickupsPage(),
        '/detailsocial': (context) => DetailScreen(),
        '/social': (context) => Social(),
        '/profile': (context) => Profile(),

      },
    );
  }
}
