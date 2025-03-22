// // import 'package:flutter/material.dart';
// // import 'package:trash_panda/views/login.dart';

// // class SignUp extends StatelessWidget {
// //   const SignUp({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Colors.white,
// //       body: Stack(
// //         children: [
// //           Positioned(
// //             top: -200,
// //             right: -200,
// //             child: Container(
// //               width: 400,
// //               height: 400,
// //               decoration: const BoxDecoration(
// //                 color: Color(0xFF80AF81),
// //                 shape: BoxShape.circle,
// //               ),
// //             ),
// //           ),
// //           Positioned(
// //             bottom: -200,
// //             left: -200,
// //             child: Container(
// //               width: 400,
// //               height: 400,
// //               decoration: const BoxDecoration(
// //                 color: Color(0xFF80AF81),
// //                 shape: BoxShape.circle,
// //               ),
// //             ),
// //           ),
// //           SafeArea(
// //             child: Center(
// //               child: Padding(
// //                 padding: const EdgeInsets.symmetric(horizontal: 40),
// //                 child: Column(
// //                   mainAxisAlignment: MainAxisAlignment.center,
// //                   crossAxisAlignment: CrossAxisAlignment.start,
// //                   children: [
// //                     const Text(
// //                       "Sign up",
// //                       style: TextStyle(
// //                         fontSize: 30,
// //                         fontWeight: FontWeight.bold,
// //                         color: Color(0xFF058B09),
// //                       ),
// //                     ),
// //                     const SizedBox(height: 15),

// //                     _buildTextField("Email"),
// //                     const SizedBox(height: 15),
// //                     _buildTextField("Password", isPassword: true),
// //                     const SizedBox(height: 15),
// //                     _buildTextField("Location"),
// //                     const SizedBox(height: 30),

// //                     ElevatedButton(
// //                       style: ElevatedButton.styleFrom(
// //                         backgroundColor: const Color(0xFF416944),
// //                         shape: RoundedRectangleBorder(
// //                           borderRadius: BorderRadius.circular(20),
// //                         ),
// //                         minimumSize: const Size(double.infinity, 50),
// //                       ),
// //                       onPressed: () {
// //                         Navigator.pushReplacement(
// //                           context,
// //                           MaterialPageRoute(builder: (context) =>  Login()),
// //                         );
// //                       },
// //                       child: const Text(
// //                         "Sign Up",
// //                         style: TextStyle(fontSize: 20, color: Colors.white),
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }

// //   Widget _buildTextField(String hint, {bool isPassword = false}) {
// //     return TextField(
// //       obscureText: isPassword,
// //       decoration: InputDecoration(
// //         hintText: hint,
// //         hintStyle: const TextStyle(fontSize: 18, color: Color(0xFF6FAD67)),
// //         filled: true,
// //         fillColor: Colors.white,
// //         enabledBorder: OutlineInputBorder(
// //           borderRadius: BorderRadius.circular(16),
// //           borderSide: const BorderSide(color: Color(0xFF416944), width: 1),
// //         ),
// //         focusedBorder: OutlineInputBorder(
// //           borderRadius: BorderRadius.circular(16),
// //           borderSide: const BorderSide(color: Color(0xFF416944), width: 1.5),
// //         ),
// //       ),
// //     );
// //   }
// // }


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
//           SafeArea(
//             child: Center(
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 40),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Text(
//                       "Sign up",
//                       style: TextStyle(
//                         fontSize: 30,
//                         fontWeight: FontWeight.bold,
//                         color: Color(0xFF058B09),
//                       ),
//                     ),
//                     const SizedBox(height: 15),

//                     _buildTextField("Username"),
//                     const SizedBox(height: 15),
//                     _buildTextField("Email"),
//                     const SizedBox(height: 15),
//                     _buildTextField("Password", isPassword: true),
//                     const SizedBox(height: 15),
//                     _buildTextField("Location"),
//                     const SizedBox(height: 15),
//                     _buildTextField("Image URL"),
//                     const SizedBox(height: 30),

//                     ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: const Color(0xFF416944),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                         minimumSize: const Size(double.infinity, 50),
//                       ),
//                       onPressed: () {
//                         Navigator.pushReplacement(
//                           context,
//                           MaterialPageRoute(builder: (context) =>  Login()),
//                         );
//                       },
//                       child: const Text(
//                         "Sign Up",
//                         style: TextStyle(fontSize: 20, color: Colors.white),
//                       ),
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
//         hintStyle: const TextStyle(fontSize: 18, color: Color(0xFF6FAD67)),
//         filled: true,
//         fillColor: Colors.white,
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(16),
//           borderSide: const BorderSide(color: Color(0xFF416944), width: 1),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(16),
//           borderSide: const BorderSide(color: Color(0xFF416944), width: 1.5),
//         ),
//       ),
//     );
//   }
// }



      
//       import 'package:flutter/material.dart';
// import 'package:trash_panda/views/login.dart';
// import 'package:trash_panda/controllers/user_controller.dart';
// import 'package:trash_panda/models/user_model.dart';

// class SignUp extends StatelessWidget {
//   final TextEditingController _usernameController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final TextEditingController _locationController = TextEditingController();
//   final UserController _userController = UserController();

//   SignUp({super.key});

//   void _register(BuildContext context) async {
//     final user = User(
//       userName: _usernameController.text,
//       email: _emailController.text,
//       password: _passwordController.text,
//       profileImageUrl: '',
//     );

//     final success = await _userController.register(
//       user.userName,
//       user.email,
//       user.password ?? '',
//       _locationController.text,
//     );

//     if (success) {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => Login()),
//       );
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Registration failed')),
//       );
//     }
//   }

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
//           SafeArea(
//             child: Center(
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 40),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Text(
//                       "Sign up",
//                       style: TextStyle(
//                         fontSize: 30,
//                         fontWeight: FontWeight.bold,
//                         color: Color(0xFF058B09),
//                       ),
//                     ),
//                     const SizedBox(height: 15),
//                     _buildTextField("Username", controller: _usernameController),
//                     const SizedBox(height: 15),
//                     _buildTextField("Email", controller: _emailController),
//                     const SizedBox(height: 15),
//                     _buildTextField("Password", controller: _passwordController, isPassword: true),
//                     const SizedBox(height: 15),
//                     _buildTextField("Location", controller: _locationController),
//                     const SizedBox(height: 30),
//                     ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: const Color(0xFF416944),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                         minimumSize: const Size(double.infinity, 50),
//                       ),
//                       onPressed: () => _register(context),
//                       child: const Text(
//                         "Sign Up",
//                         style: TextStyle(fontSize: 20, color: Colors.white),
//                       ),
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

//   Widget _buildTextField(String hint, {bool isPassword = false, TextEditingController? controller}) {
//     return TextField(
//       controller: controller,
//       obscureText: isPassword,
//       decoration: InputDecoration(
//         hintText: hint,
//         hintStyle: const TextStyle(fontSize: 18, color: Color(0xFF6FAD67)),
//         filled: true,
//         fillColor: Colors.white,
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(16),
//           borderSide: const BorderSide(color: Color(0xFF416944), width: 1),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(16),
//           borderSide: const BorderSide(color: Color(0xFF416944), width: 1.5),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trash_panda/views/login.dart';
import 'package:trash_panda/controllers/user_controller.dart';
import 'package:trash_panda/models/user_model.dart';
import 'dart:io';

class SignUp extends StatefulWidget {
  SignUp({super.key});

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final UserController _userController = UserController();
  File? _image;

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  void _register(BuildContext context) async {
    final user = User(
      userName: _usernameController.text,
      email: _emailController.text,
      password: _passwordController.text,
      profileImageUrl: _image?.path ?? '',
    );

    final success = await _userController.register(
      user.userName,
      user.email,
      user.password ?? '',
      user.profileImageUrl,
    );

    if (success) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Login()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Registration failed')),
      );
    }
  }

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
                    _buildTextField("Username", controller: _usernameController),
                    const SizedBox(height: 15),
                    _buildTextField("Email", controller: _emailController),
                    const SizedBox(height: 15),
                    _buildTextField("Password", controller: _passwordController, isPassword: true),
                    const SizedBox(height: 15),

                    // Profile Image Selection Styled as a Box
                    GestureDetector(
                      onTap: _pickImage,
                      child: Container(
                        height: 50,
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: const Color(0xFF416944), width: 1),
                        ),
                        child: Text(
                          _image == null ? "Select Profile Image" : "Image Selected",
                          style: const TextStyle(fontSize: 18, color: Color(0xFF6FAD67)),
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF416944),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        minimumSize: const Size(double.infinity, 50),
                      ),
                      onPressed: () => _register(context),
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

  Widget _buildTextField(String hint, {bool isPassword = false, TextEditingController? controller}) {
    return TextField(
      controller: controller,
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
