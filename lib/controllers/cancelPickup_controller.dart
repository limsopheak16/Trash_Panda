import 'package:trash_panda/models/scheduledHistory_model.dart';
import 'package:trash_panda/services/api_service.dart';

class ScheduledHistoryController {
  final ApiService _apiService = ApiService();

  Future<List<ScheduledhistoryModel>> fetchScheduledHistory() async {
    try {
      return await _apiService.fetchScheduledHistory();
    } catch (error) {
      print("Error fetching scheduled history: $error");
      return [];
    }
  }

  Future<void> cancelPickup(int pickupId) async {
    try {
      final cancelResult = await _apiService.cancelPickup(pickupId);
      if (cancelResult != null) {
        print("Pickup cancelled: ${cancelResult.message}");
      } else {
        print("Failed to cancel pickup");
      }
    } catch (e) {
      print("Cancel pickup error: $e");
    }
  }
}
