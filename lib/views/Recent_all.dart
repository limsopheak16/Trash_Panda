// import 'package:flutter/material.dart';

// class RecentActivities extends StatelessWidget {
//   const RecentActivities({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.green),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         title: const Text(
//           'All Recent Activities',
//           style: TextStyle(
//             color: Colors.green,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: ListView(
//           children: [
//             _buildActivityItem(
//               icon: Icons.delete_outline,
//               title: 'Plastic Collection',
//               subtitle: '3.5 kg',
//               points: '+7 points',
//               time: '2 hours ago',
//               isPositive: true,
//             ),
//             _buildActivityItem(
//               icon: Icons.delete_outline,
//               title: 'Mental Collection',
//               subtitle: '2.5 kg',
//               points: '+10 points',
//               time: 'Yesterday',
//               isPositive: true,
//             ),
//             for (int i = 0; i < 18; i++)
//               _buildActivityItem(
//                 icon: Icons.redeem,
//                 title: 'Point Redeemed',
//                 subtitle: '5.00\$',
//                 points: '-25 Points',
//                 time: '2 days ago',
//                 isPositive: false,
//               ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildActivityItem({
//     required IconData icon,
//     required String title,
//     required String subtitle,
//     required String points,
//     required String time,
//     required bool isPositive,
//   }) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 10),
//       padding: const EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//         border: Border.all(color: Colors.grey.withOpacity(0.3)),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.1),
//             spreadRadius: 1,
//             blurRadius: 3,
//             offset: const Offset(0, 1),
//           ),
//         ],
//       ),
//       child: Row(
//         children: [
//           Container(
//             padding: const EdgeInsets.all(8),
//             decoration: BoxDecoration(
//               color: const Color(0xFFECF8ED),
//               borderRadius: BorderRadius.circular(8),
//             ),
//             child: Icon(
//               icon,
//               color: const Color(0xFF80AF81),
//               size: 24,
//             ),
//           ),
//           const SizedBox(width: 12),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   title,
//                   style: const TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 14,
//                   ),
//                 ),
//                 Text(
//                   subtitle,
//                   style: TextStyle(
//                     color: Colors.grey[600],
//                     fontSize: 12,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: [
//               Text(
//                 points,
//                 style: TextStyle(
//                   color: isPositive ? const Color(0xFF80AF81) : Colors.red,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 14,
//                 ),
//               ),
//               Text(
//                 time,
//                 style: TextStyle(
//                   color: Colors.grey[600],
//                   fontSize: 12,
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:trash_panda/controllers/activity_controller.dart';
import 'package:trash_panda/models/activity_model.dart';

class RecentActivities extends StatefulWidget {
  const RecentActivities({super.key});

  @override
  State<RecentActivities> createState() => _RecentActivitiesState();
}

class _RecentActivitiesState extends State<RecentActivities> {
  final ActivityController _activityController = ActivityController();
  late Future<List<Activity>> _activitiesFuture;

  @override
  void initState() {
    super.initState();
    _activitiesFuture = _activityController.fetchActivities();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.green),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'All Recent Activities',
          style: TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: FutureBuilder<List<Activity>>(
          future: _activitiesFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator()); // Loading Indicator
            } else if (snapshot.hasError) {
              return Center(child: Text('Failed to load activities'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No recent activities'));
            }

            final activities = snapshot.data!;
            return ListView.builder(
              itemCount: activities.length,
              itemBuilder: (context, index) {
                final activity = activities[index];
                return _buildActivityItem(
                  icon: Icons.redeem, // Change icon dynamically if needed
                  title: activity.title,
                  subtitle: activity.description,
                  points: '+10 points', // Update this based on your logic
                  time: '${activity.date}', // Format as needed
                  isPositive: true, // Change based on activity type
                );
              },
            );
          },
        ),
      ),
    );
  }

  Widget _buildActivityItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required String points,
    required String time,
    required bool isPositive,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.withOpacity(0.3)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFFECF8ED),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              color: const Color(0xFF80AF81),
              size: 24,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                points,
                style: TextStyle(
                  color: isPositive ? const Color(0xFF80AF81) : Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              Text(
                time,
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
