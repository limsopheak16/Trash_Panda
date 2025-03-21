import 'package:flutter/material.dart';
import 'package:trash_panda/views/detailsocial.dart';
import 'package:trash_panda/views/post.dart';

void main() {
  runApp(const Social());
}

class Social extends StatelessWidget {
  const Social({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SocialScreen(),
    );
  }
}

class SocialScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/icons/panda.jpg'),
              radius: 20,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: "What’s on your mind?",
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ),
              ),
            ),
            const SizedBox(width: 10),
IconButton(
  icon: Icon(Icons.add_circle, color: Colors.green, size: 26),
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CreatePostScreen()),
    );
  },
),

          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          _buildPost(context, "We clean", "Choose your visuals with confidence knowing our creative library is free from AI-generated content", 'assets/icons/panda.jpg'),
          _buildPost(context, "Keep it Green", "Let's take care of our environment by reducing waste and planting trees!", 'assets/icons/panda.jpg'),
        ],
      ),
    );
  }

  Widget _buildPost(BuildContext context, String title, String description, String imageUrl) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/icons/panda.jpg'),
                ),
                const SizedBox(width: 10),
                const Text("PHEAK PANDA",
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 10),
            Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
            Text(description, style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 10),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(imageUrl, fit: BoxFit.cover),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.favorite, color: Colors.green),
                    const SizedBox(width: 5),
                    const Text("30k"),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.comment, color: Colors.green),
                    const SizedBox(width: 5),
                    const Text("Comment"),
                  ],
                ),
                Icon(Icons.share, color: Colors.green),
              ],
            ),
          ],
        ),
      ),
    );
  }

}


// import 'package:flutter/material.dart';
// import 'package:trash_panda/views/detailsocial.dart';
// import 'package:trash_panda/views/post.dart';
// import 'package:trash_panda/views/home.dart';
// import 'package:trash_panda/views/history.dart';
// import 'package:trash_panda/views/profile.dart';

// void main() {
//   runApp(const Social());
// }

// class Social extends StatelessWidget {
//   const Social({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: SocialScreen(),
//     );
//   }
// }

// class SocialScreen extends StatefulWidget {
//   @override
//   _SocialScreenState createState() => _SocialScreenState();
// }

// class _SocialScreenState extends State<SocialScreen> {
//   int _selectedIndex = 2; // Default to Social tab

//   // Pages for each tab
//   final List<Widget> _pages = [
//     HomePage(),
//     ScheduledPickupsPage(),
//     SocialContent(),
//     Profile()  ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: _pages[_selectedIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _selectedIndex,
//         selectedItemColor: Colors.green,
//         unselectedItemColor: Colors.grey,
//         onTap: (index) {
//           setState(() {
//             _selectedIndex = index;
//           });
//         },
//         items: [
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
//           BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
//           BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Social'),
//           BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
//         ],
//       ),
//     );
//   }
// }

// // The original Social page content
// class SocialContent extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         AppBar(
//           backgroundColor: Colors.white,
//           elevation: 0,
//           title: Row(
//             children: [
//               CircleAvatar(
//                 backgroundImage: AssetImage('assets/icons/panda.jpg'),
//                 radius: 20,
//               ),
//               const SizedBox(width: 10),
//               Expanded(
//                 child: TextField(
//                   decoration: InputDecoration(
//                     hintText: "What’s on your mind?",
//                     filled: true,
//                     fillColor: Colors.grey.shade200,
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(30),
//                       borderSide: BorderSide.none,
//                     ),
//                     contentPadding:
//                         EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//                   ),
//                 ),
//               ),
//               const SizedBox(width: 10),
//               IconButton(
//                 icon: Icon(Icons.add_circle, color: Colors.green, size: 26),
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => CreatePostScreen()),
//                   );
//                 },
//               ),
//             ],
//           ),
//         ),
//         Expanded(
//           child: ListView(
//             padding: const EdgeInsets.all(10),
//             children: [
//               _buildPost(context, "We clean", "Choose your visuals with confidence knowing our creative library is free from AI-generated content", 'assets/icons/panda.jpg'),
//               _buildPost(context, "Keep it Green", "Let's take care of our environment by reducing waste and planting trees!", 'assets/icons/panda.jpg'),
//             ],
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildPost(BuildContext context, String title, String description, String imageUrl) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => DetailScreen(),
//           ),
//         );
//       },
//       child: Container(
//         margin: const EdgeInsets.only(bottom: 10),
//         padding: const EdgeInsets.all(10),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(10),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.grey.withOpacity(0.2),
//               spreadRadius: 2,
//               blurRadius: 5,
//               offset: const Offset(0, 2),
//             ),
//           ],
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 CircleAvatar(
//                   backgroundImage: AssetImage('assets/icons/panda.jpg'),
//                 ),
//                 const SizedBox(width: 10),
//                 const Text("PHEAK PANDA",
//                     style: TextStyle(fontWeight: FontWeight.bold)),
//               ],
//             ),
//             const SizedBox(height: 10),
//             Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
//             Text(description, style: TextStyle(color: Colors.grey)),
//             const SizedBox(height: 10),
//             ClipRRect(
//               borderRadius: BorderRadius.circular(10),
//               child: Image.asset(imageUrl, fit: BoxFit.cover),
//             ),
//             const SizedBox(height: 10),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Row(
//                   children: [
//                     Icon(Icons.favorite, color: Colors.green),
//                     const SizedBox(width: 5),
//                     const Text("30k"),
//                   ],
//                 ),
//                 Row(
//                   children: [
//                     Icon(Icons.comment, color: Colors.green),
//                     const SizedBox(width: 5),
//                     const Text("Comment"),
//                   ],
//                 ),
//                 Icon(Icons.share, color: Colors.green),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
