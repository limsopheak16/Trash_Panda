import 'package:trash_panda/models/reward_model.dart';
import 'package:trash_panda/services/api_service.dart';

class ScheduleHistoryController {
  final ApiService _apiService = ApiService();

  Future<List<RewardModel>> fetchRewards() async {
    print("Fetching rewards in controller........"); // Print a message when fetching data
    try {
      final data = await _apiService.fetchRewards();
      print("Fetched data in controller::::::::::: $data"); // Print fetched data in controller
      return data;
    } catch (error) {
      print("Error fetching rewards in controller: $error");
      return []; // Return an empty list in case of error
    }
  }

}
