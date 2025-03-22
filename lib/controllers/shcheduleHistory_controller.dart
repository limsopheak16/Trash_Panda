import 'package:trash_panda/models/scheduledHistory_model.dart';
import 'package:trash_panda/services/api_service.dart';

class ShchedulehistoryController {
  final ApiService _apiService = ApiService();

  Future<List<ScheduledhistoryModel>> fetchScheduledHistory() {
    return _apiService.fetchScheduledHistory();
    
    
  }
}
  