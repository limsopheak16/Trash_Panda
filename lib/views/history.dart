import 'package:flutter/material.dart';
import 'package:trash_panda/models/scheduledHistory_model.dart';
import 'package:trash_panda/controllers/shcheduleHistory_controller.dart';

class ScheduledPickupsPage extends StatelessWidget {
  const ScheduledPickupsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ScheduleHistoryController controller = ScheduleHistoryController();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Scheduled Pickups',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Expanded(
              child: FutureBuilder<List<ScheduledhistoryModel>>(
                future: controller.fetchScheduledHistory(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        'Something went wrong! Please try again.',
                        style: TextStyle(color: Colors.red, fontSize: 16),
                      ),
                    );
                  }

                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(
                      child: Text('No scheduled pickups found.'),
                    );
                  }

                  final scheduledHistory = snapshot.data!;

                  return ListView.builder(
                    itemCount: scheduledHistory.length,
                    itemBuilder: (context, index) {
                      final pickup = scheduledHistory[index];

                      return buildPickupCard(
                        context: context,
                        controller: controller,
                        pickupId: pickup.pickupId,
                        date: pickup.date,
                        time: pickup.date, // Extract time properly if available
                        materials: pickup.wasteTypes.split(','),
                        estimateWeight: pickup.estimateWeight,
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
    required BuildContext context,
    required ScheduleHistoryController controller,
    required int pickupId,
    required String date,
    required String time,
    required List<String> materials,
    required int estimateWeight,
    required String status,
    required Color statusColor,
    required bool showCancelButton,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Status and Date Section
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: statusColor.withOpacity(0.2),
              borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  date,
                  style: TextStyle(fontWeight: FontWeight.bold, color: statusColor),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
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
          const SizedBox(height: 8),

          /// Time Row
          Row(
            children: [
              const Icon(Icons.access_time, size: 16, color: Colors.black54),
              const SizedBox(width: 8),
              Text(time, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
            ],
          ),
          const SizedBox(height: 8),

          /// Materials Row
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: materials
                .map((mat) => Chip(
                      label: Text(mat, style: const TextStyle(color: Colors.green)),
                      backgroundColor: Colors.green[100],
                    ))
                .toList(),
          ),
          const SizedBox(height: 8),

          /// Estimated Weight
          Row(
            children: [
              const Icon(Icons.scale, size: 16, color: Colors.black54),
              const SizedBox(width: 8),
              Text('$estimateWeight kg', style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
            ],
          ),
          const SizedBox(height: 8),

          /// Cancel Button
          if (showCancelButton)
            Align(
              alignment: Alignment.center,
              child: TextButton(
                onPressed: () => _confirmCancel(context, controller, pickupId),
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(color: Colors.red, width: 1),
                  ),
                  backgroundColor: Colors.red[50],
                  foregroundColor: Colors.red,
                ),
                child: const Text('Cancel Pickup'),
              ),
            ),
        ],
      ),
    );
  }

  void _confirmCancel(BuildContext context, ScheduleHistoryController controller, int pickupId) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Cancel Pickup'),
        content: const Text('Are you sure you want to cancel this pickup?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context), // Close the dialog
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(context); // Close the dialog
              await controller.deleteHistoryPickup(pickupId); // Call API
              // Refresh UI
              (context as Element).markNeedsBuild();
            },
            child: const Text('Yes', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}
