import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:trash_panda/models/scheduledHistory_model.dart';
import 'package:trash_panda/models/user_model.dart';
import 'package:trash_panda/models/activity_model.dart';
import 'package:trash_panda/services/storage_service.dart';
import 'package:trash_panda/models/cancelPickup_model.dart';

class ApiService {
  static const String baseUrl = 'https://pay1.jetdev.life';
  final StorageService _storageService = StorageService();

  // ✅ Login User
  Future<User?> login(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/api/account/login'),
        body: jsonEncode({'username': email, 'password': password}),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final user = User.fromJson(jsonDecode(response.body));
        if (user.token != null) {
          await _storageService.saveToken(user.token!);
        }
        return user;
      } else {
        print("Login failed: ${response.body}");
        return null;
      }
    } catch (e) {
      print("Login error: $e");
      return null;
    }
  }

  // ✅ Register User
  Future<bool> register(User user) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/api/account/register'),
        body: jsonEncode(user.toJson()),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        print("Registration failed: ${response.body}");
        return false;
      }
    } catch (e) {
      print("Registration error: $e");
      return false;
    }
  }

  // ✅ Fetch User Profile
  Future<User?> getProfile() async {
    try {
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
      } else {
        print("Failed to fetch user profile: ${response.body}");
        return null;
      }
    } catch (e) {
      print("Profile fetch error: $e");
      return null;
    }
  }

  // ✅ Fetch Activities
  Future<List<Activity>> fetchActivities({int limit = 20}) async {
    try {
      final token = await _storageService.getToken();
      if (token == null) {
        throw Exception('Token not found');
      }

      final response = await http.get(
        Uri.parse('$baseUrl/api/account/activity?limit=$limit'),
        headers: {'Authorization': 'Bearer $token'},
      );

      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        return data.map((json) => Activity.fromJson(json)).toList();
      } else {
        print("Failed to fetch activities: ${response.body}");
        return [];
      }
    } catch (e) {
      print("Activities fetch error: $e");
      return [];
    }
  }

  // Fetch Scheduled History
  Future<List<ScheduledhistoryModel>> fetchScheduledHistory({int limit = 20}) async {
    try {
      final token = await _storageService.getToken();
      if (token == null) {
        throw Exception('Token not found');
      }

      final response = await http.get(
        Uri.parse('$baseUrl/api/pickup/history?limit=$limit'),
        headers: {'Authorization': 'Bearer $token'},
      );

      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);

        // Debugging: Print raw API response
        print("Fetched Scheduled History: $data");

        return data.map((json) => ScheduledhistoryModel.fromJson(json)).toList();
      } else {
        print("Failed to fetch scheduled history: ${response.body}");
        return [];
      }
    } catch (e) {
      print("Scheduled history fetch error: $e");
      return [];
    }
  }

   // Cancel Pickup API
  Future<CancelPickupModel?> cancelPickup(int pickupId) async {
    try {
      final token = await _storageService.getToken();
      if (token == null) throw Exception('Token not found');

      final response = await http.delete(
        Uri.parse('$baseUrl/api/pickup/cancel/$pickupId'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        return CancelPickupModel.fromJson(jsonDecode(response.body));
      } else {
        print("Failed to cancel pickup: ${response.body}");
        return null;
      }
    } catch (e) {
      print("Cancel pickup error: $e");
      return null;
    }
  }
}
