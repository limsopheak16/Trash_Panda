import 'package:trash_panda/models/cancelPickup_model.dart';
import 'package:trash_panda/models/scheduledHistory_model.dart';
import 'package:trash_panda/services/api_service.dart';

class ScheduleHistoryController {
  final ApiService _apiService = ApiService();

  Future<List<ScheduledhistoryModel>> fetchScheduledHistory() async {
    print("Fetching scheduled history in controller........"); // Print a message when fetching data
    try {
      final data = await _apiService.fetchScheduledHistory();
      print("Fetched data in controller: $data"); // Print fetched data in controller
      return data;
    } catch (error) {
      print("Error fetching scheduled history in controller: $error");
      return []; // Return an empty list in case of error
    }
  }

  Future<Future<List<HistoryPickupModel>>> deleteHistoryPickup(int pickupId) async {
    return _apiService.deleteHistoryPickup(pickupId);

  }

}
