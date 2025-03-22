import 'package:flutter/material.dart';
import 'package:trash_panda/models/user_model.dart';
import 'package:trash_panda/services/api_service.dart';

class ProfileController extends ChangeNotifier {
  User? _profile;
  bool _isLoading = true;

  User? get profile => _profile;
  bool get isLoading => _isLoading;

  final ApiService _service = ApiService();

  Future<void> loadProfile() async {
    try {
      _profile = await _service.getProfile();
    } catch (e) {
      print("Error fetching profile: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
