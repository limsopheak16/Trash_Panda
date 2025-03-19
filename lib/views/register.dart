// import 'package:flutter/material.dart';
// import 'package:trash_panda/views/login.dart';


// class SignUp extends StatelessWidget {
//   const SignUp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Stack(
//         children: [
//           Positioned(
//             top: -200,
//             right: -200,
//             child: Container(
//               width: 400,
//               height: 400,
//               decoration: const BoxDecoration(
//                 color: Color(0xFF80AF81),
//                 shape: BoxShape.circle,
//               ),
//             ),
//           ),
//           Positioned(
//             bottom: -200,
//             left: -200,
//             child: Container(
//               width: 400,
//               height: 400,
//               decoration: const BoxDecoration(
//                 color: Color(0xFF80AF81),
//                 shape: BoxShape.circle,
//               ),
//             ),
//           ),
//           // Wrap everything inside a SafeArea
//           SafeArea(
//             child: Center(
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 30),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Text(
//                       "Sign up",
//                       style: TextStyle(
//                         fontSize: 30,
//                         fontWeight: FontWeight.bold,
//                       color: Color(0xFF058B09),
//                       ),
//                     ),
//                    const SizedBox(height: 15),
//                   TextField(
//                     decoration: InputDecoration(
//                       hintText: 'Email',
//                       hintStyle:
//                           TextStyle(fontSize: 18, color: Color(0xFF6FAD67)),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(16),
//                       ),
//                     ),
//                   ),
//                const SizedBox(height: 15),
//                   TextField(
//                     decoration: InputDecoration(
//                       hintText: 'Password',
//                       hintStyle:
//                           TextStyle(fontSize: 18, color: Color(0xFF6FAD67)),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(16),
//                       ),
//                     ),
//                   ),     const SizedBox(height: 15),
//                   Padding(
//                     padding: const EdgeInsets.only(bottom: 60),
//                     child: TextField(
//                       decoration: InputDecoration(
//                         hintText: 'Location',
//                         hintStyle:
//                             TextStyle(fontSize: 18, color: Color(0xFF6FAD67)),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(16),
//                         ),
//                       ),
//                     ),
//                   ),
                  
//                     ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: const Color(0xFF416944),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                         minimumSize: const Size(double.infinity, 50),
//                       ),
//                                   onPressed: () {
//                   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login()));
//                 },
//                 child: const Text("Sign Up", style: TextStyle(fontSize: 20, color: Colors.white)),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildTextField(String hint, {bool isPassword = false}) {
//     return TextField(
//       obscureText: isPassword,
//       decoration: InputDecoration(
//         hintText: hint,
//         hintStyle: const TextStyle(color: Color(0xFF416944)),
//         filled: true,
//         fillColor: Colors.white,
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(12),
//           borderSide: const BorderSide(color: Color(0xFF416944), width: 1),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(12),
//           borderSide: const BorderSide(color: Color(0xFF416944), width: 1.5),
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:trash_panda/views/login.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: -200,
            right: -200,
            child: Container(
              width: 400,
              height: 400,
              decoration: const BoxDecoration(
                color: Color(0xFF80AF81),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            bottom: -200,
            left: -200,
            child: Container(
              width: 400,
              height: 400,
              decoration: const BoxDecoration(
                color: Color(0xFF80AF81),
                shape: BoxShape.circle,
              ),
            ),
          ),
          SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Sign up",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF058B09),
                      ),
                    ),
                    const SizedBox(height: 15),

                    _buildTextField("Email"),
                    const SizedBox(height: 15),
                    _buildTextField("Password", isPassword: true),
                    const SizedBox(height: 15),
                    _buildTextField("Location"),
                    const SizedBox(height: 30),

                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF416944),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        minimumSize: const Size(double.infinity, 50),
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) =>  Login()),
                        );
                      },
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(String hint, {bool isPassword = false}) {
    return TextField(
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(fontSize: 18, color: Color(0xFF6FAD67)),
        filled: true,
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Color(0xFF416944), width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Color(0xFF416944), width: 1.5),
        ),
      ),
    );
  }
}
