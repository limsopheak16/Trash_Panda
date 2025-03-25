import 'package:flutter/material.dart';
import 'package:trash_panda/views/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NotificationsScreen(),
      theme: ThemeData(
        fontFamily: 'Inter', // Assuming a clean, modern font
      ),
    );
  }
}

class NotificationsScreen extends StatelessWidget {
  final List<NotificationItem> notifications = [
    NotificationItem(
      name: "Gabrielle Spencer",
      action: "accepted the",
      target: "Invitations for Teamate app",
      time: "Now",
      imageUrl:
          "https://static.vecteezy.com/system/resources/previews/016/704/369/non_2x/illustration-of-cute-cartoon-panda-sleep-on-bamboo-design-vector.jpg",
      isNew: true,
    ),
    NotificationItem(
      name: "Peter Hermann",
      action: "invited you to join",
      target: "Teamate",
      time: "Yesterday",
      imageUrl:
          "https://static.vecteezy.com/system/resources/previews/016/704/369/non_2x/illustration-of-cute-cartoon-panda-sleep-on-bamboo-design-vector.jpg",
    ),
    NotificationItem(
      name: "Peter Hermann",
      action: "invited you to join",
      target: "Teamate",
      time: "Yesterday",
      imageUrl:
          "https://static.vecteezy.com/system/resources/previews/016/704/369/non_2x/illustration-of-cute-cartoon-panda-sleep-on-bamboo-design-vector.jpg",
    ),
    NotificationItem(
      name: "Peter Hermann",
      action: "invited you to join",
      target: "Teamate",
      time: "Yesterday",
      imageUrl:
          "https://static.vecteezy.com/system/resources/previews/016/704/369/non_2x/illustration-of-cute-cartoon-panda-sleep-on-bamboo-design-vector.jpg",
    ),
    NotificationItem(
      name: "Peter Hermann",
      action: "invited you to join",
      target: "Teamate",
      time: "Yesterday",
      imageUrl:
          "https://static.vecteezy.com/system/resources/previews/016/704/369/non_2x/illustration-of-cute-cartoon-panda-sleep-on-bamboo-design-vector.jpg",
    ),
    NotificationItem(
      name: "Peter Hermann",
      action: "invited you to join",
      target: "Teamate",
      time: "Yesterday",
      imageUrl:
          "https://static.vecteezy.com/system/resources/previews/016/704/369/non_2x/illustration-of-cute-cartoon-panda-sleep-on-bamboo-design-vector.jpg",
    ),
    NotificationItem(
      name: "Peter Hermann",
      action: "invited you to join",
      target: "Teamate",
      time: "Yesterday",
      imageUrl:
          "https://static.vecteezy.com/system/resources/previews/016/704/369/non_2x/illustration-of-cute-cartoon-panda-sleep-on-bamboo-design-vector.jpg",
    ),
    NotificationItem(
      name: "Peter Hermann",
      action: "invited you to join",
      target: "Teamate",
      time: "Yesterday",
      imageUrl:
          "https://static.vecteezy.com/system/resources/previews/016/704/369/non_2x/illustration-of-cute-cartoon-panda-sleep-on-bamboo-design-vector.jpg",
    ),
    NotificationItem(
      name: "Peter Hermann",
      action: "invited you to join",
      target: "Teamate",
      time: "Yesterday",
      imageUrl:
          "https://static.vecteezy.com/system/resources/previews/016/704/369/non_2x/illustration-of-cute-cartoon-panda-sleep-on-bamboo-design-vector.jpg",
    ),
    NotificationItem(
      name: "Kate Johnson",
      action: "invited you to join",
      target: "Teamate app",
      time: "Today",
      imageUrl:
          "https://static.vecteezy.com/system/resources/previews/016/704/369/non_2x/illustration-of-cute-cartoon-panda-sleep-on-bamboo-design-vector.jpg",
    ),
    NotificationItem(
      name: "Mathew Kenny",
      action: "accepted the",
      target: "Invitations for Teamate app",
      time: "Today",
      imageUrl:
          "https://static.vecteezy.com/system/resources/previews/016/704/369/non_2x/illustration-of-cute-cartoon-panda-sleep-on-bamboo-design-vector.jpg",
    ),
    NotificationItem(
      name: "Kara Foster",
      action: "declined the",
      target: "Invitations for Teamate",
      time: "Today",
      imageUrl:
          "https://static.vecteezy.com/system/resources/previews/016/704/369/non_2x/illustration-of-cute-cartoon-panda-sleep-on-bamboo-design-vector.jpg",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,                                 color: Color(0xFF058B09),
),
          onPressed: () {
            // Navigate to the OtherPage when the button is clicked
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
        ),
        title: Text(
          "Notifications",
          style: TextStyle(
            color: Color(0xFF058B09),
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionHeader("New", Colors.green),
            _buildNotificationSection(
              notifications.where((n) => n.isNew).toList(),
            ),
            _buildSectionHeader("Today", Colors.green),
            _buildNotificationSection(
              notifications
                  .where((n) => !n.isNew && n.time.contains("Today"))
                  .toList(),
            ),
            _buildSectionHeader("Yesterday", Colors.green),
            _buildNotificationSection(
              notifications.where((n) => n.time.contains("Yesterday")).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Text(
        title,
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
      ),
    );
  }

  Widget _buildNotificationSection(
      List<NotificationItem> sectionNotifications) {
    return Column(
      children: sectionNotifications.map((notification) {
        return Container(
          margin: EdgeInsets.only(bottom: 12),
          decoration: BoxDecoration(
            color: notification.isNew ? Colors.green.shade50 : Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: notification.isNew
                  ? Colors.green.shade100
                  : Colors.grey.shade200,
              width: 1,
            ),
          ),
          child: ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            leading: CircleAvatar(
              radius: 24,
              backgroundImage: NetworkImage(notification.imageUrl),
            ),
            title: RichText(
              text: TextSpan(
                style: TextStyle(color: Colors.black, fontSize: 14),
                children: [
                  TextSpan(
                    text: notification.name,
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  TextSpan(
                    text: " ${notification.action} ",
                    style: TextStyle(color: Colors.grey),
                  ),
                  TextSpan(
                    text: notification.target,
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            trailing: Text(
              notification.time,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}

class NotificationItem {
  final String name;
  final String action;
  final String target;
  final String time;
  final String imageUrl;
  final bool isNew;

  NotificationItem({
    required this.name,
    required this.action,
    required this.target,
    required this.time,
    required this.imageUrl,
    this.isNew = false,
  });
}
