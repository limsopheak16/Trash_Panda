import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:trash_panda/models/scheduledHistory_model.dart';
import 'package:trash_panda/models/user_model.dart'; // Ensure this import exists
import 'package:trash_panda/models/activity_model.dart'; // Ensure this import exists
import 'package:trash_panda/services/storage_service.dart';
import 'package:trash_panda/models/pickup_model.dart';

class ApiService {
  static const String baseUrl = 'https://pay1.jetdev.life';
  final StorageService _storageService = StorageService();

  Future<User?> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/account/login'),
      body: jsonEncode({'username': email, 'password': password}),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      final user = User.fromJson(jsonDecode(response.body));
      if (user.token != null) {
        await _storageService.saveToken(user.token!); // Save token
      }
      return user;
    }
    return null;
  }

  Future<bool> register(User user) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/account/register'),
      body: jsonEncode(user.toJson()), // Includes password in the payload
      headers: {'Content-Type': 'application/json'},
    );
    return response.statusCode == 200;
  }

  Future<List<Activity>> fetchActivities({int limit = 20}) async {
    final token = await _storageService.getToken(); // Retrieve token
    if (token == null) {
      throw Exception('Token not found');
    }

    final response = await http.get(
      Uri.parse('$baseUrl/api/account/activity?limit=$limit'),
      headers: {'Authorization': 'Bearer $token'}, // Use token
    );

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Activity.fromJson(json)).toList();
    }
    return [];
  }
  // Fetch User Profile
  Future<User?> getProfile() async {
    final token = await _storageService.getToken();
    if (token == null) {
      throw Exception('Token not found');
    }

    final response = await http.get(
      Uri.parse('$baseUrl/api/account/user'),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    }
    return null;
  }
  // shceduled history
  Future<List<ScheduledhistoryModel>> fetchScheduledHistory({int limit = 20}) async {
    final token = await _storageService.getToken(); // Retrieve token
    if (token == null) {
      throw Exception('Token not found');
    }

    final response = await http.get(
      Uri.parse('$baseUrl/api/pickup/history?limit=$limit'),
      headers: {'Authorization': 'Bearer $token'}, // Use token
    );

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => ScheduledhistoryModel.fromJson(json)).toList();
    }
    return [];
  }
  

Future<List<ScheduleModel>> createNewSchedule({
    int limit = 20,
    required String userId,
    required String date,
    required List<String> wasteTypes,
    required double estimateWeight,
    required bool recurring,
  }) async {
    final token = await _storageService.getToken();
    if (token == null) {
      throw Exception('Token not found');
    }

    // Create the request body
    final requestBody = {
      "userId": userId,
      "date": date,
      "wasteTypes": wasteTypes.isNotEmpty ? wasteTypes : [],
      "estimateWeight": estimateWeight,
      "recurring": recurring,
    };

    final response = await http.post(
      Uri.parse('$baseUrl/api/pickup/schedule?limit=$limit'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },

      body: jsonEncode(requestBody), // Encode the body to JSON
    );

    if (response.statusCode == 200) {
      final decodedData = jsonDecode(response.body);

      if (decodedData is List) {
        return decodedData.map((json) => ScheduleModel.fromJson(json)).toList();
      } else if (decodedData is Map<String, dynamic>) {
        return [ScheduleModel.fromJson(decodedData)];
      } else {
        throw Exception('Unexpected response format');
      }
    } else {
      throw Exception('Failed to create schedule');
    }
  }
}


