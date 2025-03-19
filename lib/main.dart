// import 'package:flutter/material.dart';
// import 'package:trash_panda/views/home.dart';
// import 'package:trash_panda/views/splash.dart';
// import 'package:trash_panda/views/login.dart';
// import 'package:trash_panda/views/register.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(fontFamily: 'Poppins'),
//       home: HomePage(), 
//       routes: {
//         '/splash': (context) => Splash(),   
//         '/login': (context) => Login(),
//         '/register': (context) => SignUp(),
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:trash_panda/views/home.dart';
import 'package:trash_panda/views/splash.dart';
import 'package:trash_panda/views/login.dart';
import 'package:trash_panda/views/register.dart';
import "package:trash_panda/views/Recent_all.dart";

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

      },
    );
  }
}
