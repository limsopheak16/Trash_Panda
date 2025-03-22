import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trash_panda/controllers/profile_controller.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProfileController()..loadProfile(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Consumer<ProfileController>(
          builder: (context, controller, child) {
            if (controller.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (controller.profile == null) {
              return const Center(child: Text("Failed to load profile"));
            }

            final profile = controller.profile!;
            return Column(
              children: [
                const SizedBox(height: 50),
                _buildTopIcons(),
                _buildHeader(profile.userName, profile.email, profile.profileImageUrl),
                const SizedBox(height: 40),
                _buildStats(),
                const SizedBox(height: 40),
                _buildOptions(),
                const Spacer(),
              ],
            );
          },
        ),
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
              onTap: () {},
              child: Image.asset('assets/icons/edit.png', width: 28, height: 28),
            ),
          ),
          const SizedBox(width: 15),
          CircleAvatar(
            backgroundColor: Colors.red.shade100,
            radius: 25,
            child: IconButton(
              icon: const Icon(Icons.logout, color: Colors.redAccent, size: 28),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(String name, String email, String imageUrl) {
    return Column(
      children: [
        CircleAvatar(
          radius: 80,
          backgroundImage: NetworkImage(imageUrl),
        ),
        const SizedBox(height: 20),
        Text(name, style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
        Text(email, style: const TextStyle(color: Colors.grey, fontSize: 18)),
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
      decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          Text(value, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 5),
          Text(label, textAlign: TextAlign.center, style: const TextStyle(fontSize: 16, color: Colors.black54)),
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
}
