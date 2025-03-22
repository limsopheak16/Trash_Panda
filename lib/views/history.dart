import 'package:flutter/material.dart';
import 'package:trash_panda/models/scheduledHistory_model.dart';
import 'package:trash_panda/controllers/shcheduleHistory_controller.dart';

class ScheduledPickupsPage extends StatelessWidget {
  const ScheduledPickupsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ShchedulehistoryController controller = ShchedulehistoryController();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Hello, Pheak',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Start your waste to be money',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF186235),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 25,
                  height: 25,
                  decoration: const BoxDecoration(shape: BoxShape.circle),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      'assets/icons/bell.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    shape: BoxShape.circle,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(45),
                    child: Image.asset(
                      'assets/icons/panda.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            const Text(
              'Your Scheduled Pickups',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: FutureBuilder<List<ScheduledhistoryModel>>(
                future: controller.fetchScheduledHistory(), // Fetch the scheduled history
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  }

                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('No scheduled pickups found.'));
                  }

                  final scheduledHistory = snapshot.data!;

                  return ListView.builder(
                    itemCount: scheduledHistory.length,
                    itemBuilder: (context, index) {
                      final pickup = scheduledHistory[index];
                      return buildPickupCard(
                        date: pickup.date.toIso8601String(), // Adjust this for date
                        time: pickup.date.toIso8601String(), // Adjust this for time
                        materials: pickup.wasteTypes.split(','), // Assuming wasteTypes are comma-separated
                        weight: 'N/A', // Adjust this if weight data is available
                        status: pickup.status,
                        statusColor: pickup.status == 'Scheduled' ? Colors.green : Colors.grey,
                        showCancelButton: pickup.status == 'Scheduled',
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPickupCard({
    required String date,
    required String time,
    required List<String> materials,
    required String weight,
    required String status,
    required Color statusColor,
    required bool showCancelButton,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: statusColor.withOpacity(0.2),
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(10)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  date,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: statusColor),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: statusColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    status,
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.access_time, size: 16),
                    const SizedBox(width: 8),
                    Text(time, style: const TextStyle(fontSize: 14)),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: materials
                      .map((mat) => Container(
                            margin: const EdgeInsets.only(right: 8),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.green[100],
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              mat,
                              style: const TextStyle(
                                  color: Colors.green, fontSize: 12),
                            ),
                          ))
                      .toList(),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.scale, size: 16),
                    const SizedBox(width: 8),
                    Text(weight, style: const TextStyle(fontSize: 14)),
                  ],
                ),
                const SizedBox(height: 8),
                if (showCancelButton)
                  Align(
                    alignment: Alignment.center,
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(color: Colors.red, width: 1),
                        ),
                        backgroundColor:
                            const Color.fromARGB(251, 250, 248, 248),
                        foregroundColor: Colors.red,
                      ),
                      child: const Text('Cancel Pickup'),
                    ),
                  )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
