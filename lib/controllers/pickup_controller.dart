import 'package:trash_panda/services/api_service.dart';
import 'package:trash_panda/models/pickup_model.dart';

class ScheduleController {
  final ApiService _apiService = ApiService();

  Future<List<ScheduleModel>> createNewSchedule({
    required String userId,
    required String date,
    required List<String> wasteTypes,
    required double estimateWeight,
    required bool recurring,
  }) async {
    return await _apiService.createNewSchedule(
      userId: userId,
      date: date,
      wasteTypes: wasteTypes.isNotEmpty ? wasteTypes : [],
      estimateWeight: estimateWeight,
      recurring: recurring,
    );
  }
}