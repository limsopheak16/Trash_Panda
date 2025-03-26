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
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.green.shade100, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            _buildAppBar(context),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                children: [
                  _buildPost(
                    context,
                    "We clean",
                    "Choose your visuals with confidence knowing our creative library is free from AI-generated content.",
                    'assets/icons/panda1.jpg',
                  ),
                  _buildPost(
                    context,
                    "Keep it Green",
                    "Let's take care of our environment by reducing waste and planting trees!",
                    'assets/icons/panda2.jpg',
                  ),   _buildPost(
                    context,
                    "Keep it Green",
                    "Let's take care of our environment by reducing waste and planting trees!",
                    'assets/icons/panda3.jpg',
                  ),   _buildPost(
                    context,
                    "Keep it Green",
                    "Let's take care of our environment by reducing waste and planting trees!",
                    'assets/icons/panda4.jpg',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/icons/panda5.jpg'),
              radius: 24,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.green.withOpacity(0.1),
                      spreadRadius: 2,
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "What’s on your mind?",
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    prefixIcon: Icon(Icons.edit, color: Colors.green.shade400),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            IconButton(
              icon: Icon(Icons.add_circle, color: Colors.green, size: 32),
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
    );
  }

  Widget _buildPost(BuildContext context, String title, String description, String imageUrl) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailScreen()),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 14),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.9),
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.green.withOpacity(0.2),
              spreadRadius: 3,
              blurRadius: 12,
              offset: Offset(0, 4),
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
                  radius: 22,
                ),
                const SizedBox(width: 10),
                const Text(
                  "PHEAK PANDA",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Spacer(),
                Icon(Icons.more_horiz, color: Colors.grey.shade500),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Text(
              description,
              style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
            ),
            const SizedBox(height: 10),
            ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Image.asset(imageUrl, fit: BoxFit.cover),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildLikeButton(),
                _buildIconText(Icons.comment, "Comment"),
                Icon(Icons.share, color: Colors.green, size: 24),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLikeButton() {
    return GestureDetector(
      onTap: () {},
      child: Row(
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 300),
            child: Icon(Icons.favorite_border, color: Colors.green, size: 24),
          ),
          const SizedBox(width: 6),
          const Text("30k", style: TextStyle(fontSize: 14)),
        ],
      ),
    );
  }

  Widget _buildIconText(IconData icon, String label) {
    return Row(
      children: [
        Icon(icon, color: Colors.green, size: 22),
        const SizedBox(width: 6),
        Text(label, style: TextStyle(fontSize: 14)),
      ],
    );
  }
}
