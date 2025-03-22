import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:trash_panda/models/point_model.dart';
import 'package:trash_panda/services/storage_service.dart';

class PointsController {
  static const String baseUrl = 'https://pay1.jetdev.life/api/account/points';
  final StorageService _storageService = StorageService();
Future<Point?> fetchPoints() async {
  final token = await _storageService.getToken();
  if (token == null) {
    throw Exception('Token not found');
  }

  final response = await http.get(
    Uri.parse(baseUrl),
    headers: {'Authorization': 'Bearer $token'},
  );

  if (response.statusCode == 200) {
    final Map<String, dynamic> data = jsonDecode(response.body);
    return Point.fromJson(data);
  }
  return null;
}

}
