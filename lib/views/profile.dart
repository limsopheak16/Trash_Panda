import 'package:flutter/material.dart';

void main() {
  runApp(const Profile());
}

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(height: 50),
          _buildTopIcons(),
          _buildHeader(),
          const SizedBox(height: 40),
          _buildStats(),
          const SizedBox(height: 40),
          _buildOptions(),
          const Spacer(),
          _buildBottomNavigation(),
        ],
      ),
    );
  }

Widget _buildTopIcons() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CircleAvatar(
          backgroundColor: Colors.green.shade100,
          radius: 25,
          child: GestureDetector(
            onTap: () {
              // Handle tap action
            },
            child: Image.asset(
              'assets/icons/edit.png',
              width: 28, // Adjust size as needed
              height: 28,
            ),
          ),
        ),
        const SizedBox(width: 15),
        CircleAvatar(
          backgroundColor: Colors.red.shade100,
          radius: 25,
          child: IconButton(
            icon: Icon(Icons.logout, color: Colors.redAccent, size: 28),
            onPressed: () {},
          ),
        ),
      ],
    ),
  );
}


  Widget _buildHeader() {
    return Column(
      children: [
        const CircleAvatar(
          radius: 80,
          backgroundImage: AssetImage('assets/icons/panda.jpg'),
        ),
        const SizedBox(height: 20),
        const Text(
          'PHEAK PANDA',
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
        ),
        const Text(
          'limpreak.panda@gmail.com',
          style: TextStyle(color: Colors.grey, fontSize: 18),
        ),
      ],
    );
  }

  Widget _buildStats() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _statBox('25', 'Total Points', Colors.green.shade300),
          _statBox('2.50\$', 'Total Money', Colors.grey.shade300),
          _statBox('30', 'Pickup', Colors.grey.shade300),
        ],
      ),
    );
  }

  Widget _statBox(String value, String label, Color color) {
    return Container(
      width: 120,
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16, color: Colors.black54),
          ),
        ],
      ),
    );
  }

  Widget _buildOptions() {
    return Column(
      children: [
        _optionItem(Icons.person, 'Username', '@pheak_panda'),
        _optionItem(Icons.notifications, 'Notification', 'Mute, Push, Email'),
        _optionItem(Icons.settings, 'Setting', 'Security, Privacy'),
      ],
    );
  }

  Widget _optionItem(IconData icon, String title, String subtitle) {
    return ListTile(
      leading: Icon(icon, color: Colors.green, size: 30),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
      subtitle: Text(subtitle, style: const TextStyle(color: Colors.grey, fontSize: 16)),
      trailing: const Icon(Icons.arrow_forward_ios, size: 20),
    );
  }

  Widget _buildNavItem(IconData icon, String label, bool isActive) {
    return GestureDetector(
      onTap: () {
        // Handle navigation tap
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isActive ? const Color(0xFF80AF81) : Colors.grey,
            size: 24,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: isActive ? const Color(0xFF80AF81) : Colors.grey,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigation() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, -1),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(Icons.home, 'Home', false),
          _buildNavItem(Icons.history, 'History', false),
          _buildNavItem(Icons.people, 'Social', false),
          _buildNavItem(Icons.person, 'Profile', true),
        ],
      ),
    );
  }
}
