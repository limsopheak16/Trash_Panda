import 'package:flutter/material.dart';

class ScheduledPickupsPage extends StatelessWidget {
  const ScheduledPickupsPage({super.key});

  @override
  Widget build(BuildContext context) {
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
              children: [
                const Text(
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
            )
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
              child: ListView(
                children: [
                  buildPickupCard(
                    date: 'Mar 19, 2025',
                    time: '09:00 AM',
                    materials: ['Plastic', 'Metal'],
                    weight: '2.5 kg',
                    status: 'Scheduled',
                    statusColor: Colors.green,
                    showCancelButton: true,
                  ),
                  buildPickupCard(
                    date: 'Mar 12, 2025',
                    time: '09:00 AM',
                    materials: ['Paper', 'Metal'],
                    weight: '3.5 kg',
                    status: 'Completed',
                    statusColor: Colors.grey,
                    showCancelButton: false,
                  ),
                  buildPickupCard(
                    date: 'Mar 12, 2025',
                    time: '09:00 AM',
                    materials: ['Paper', 'Metal'],
                    weight: '3.5 kg',
                    status: 'Completed',
                    statusColor: Colors.grey,
                    showCancelButton: false,
                  ),
                  buildPickupCard(
                    date: 'Mar 12, 2025',
                    time: '09:00 AM',
                    materials: ['Paper', 'Metal'],
                    weight: '3.5 kg',
                    status: 'Completed',
                    statusColor: Colors.grey,
                    showCancelButton: false,
                  ),
                  buildPickupCard(
                    date: 'Mar 12, 2025',
                    time: '09:00 AM',
                    materials: ['Paper', 'Metal'],
                    weight: '3.5 kg',
                    status: 'Completed',
                    statusColor: Colors.grey,
                    showCancelButton: false,
                  ),
                  buildPickupCard(
                    date: 'Mar 12, 2025',
                    time: '09:00 AM',
                    materials: ['Paper', 'Metal'],
                    weight: '3.5 kg',
                    status: 'Completed',
                    statusColor: Colors.grey,
                    showCancelButton: false,
                  ),
                  buildPickupCard(
                    date: 'Mar 12, 2025',
                    time: '09:00 AM',
                    materials: ['Paper', 'Metal'],
                    weight: '3.5 kg',
                    status: 'Completed',
                    statusColor: Colors.grey,
                    showCancelButton: false,
                  ),
                ],
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
