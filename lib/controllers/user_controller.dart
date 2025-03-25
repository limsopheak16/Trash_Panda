// import 'package:trash_panda/bloc/user_bloc.dart';
// import 'package:trash_panda/models/user_model.dart';
// import 'package:trash_panda/services/api_service.dart';

// class UserController {
//   final ApiService _apiService = ApiService();

//   Future<User?> login(String username, String password, [UserBloc? userBloc]) async { // Made UserBloc optional
//     final user = await _apiService.login(username, password);
//     if (user != null && userBloc != null) { // Null check for userBloc
//       userBloc.add(SetUserEvent(user)); // Dispatch user event to bloc
//     }
//     return user;
//   }

//   Future<bool> register(String email, String profileImageUrl, String username, String password) async {
//     final user = User(
//       email: email,
//       profileImageUrl: profileImageUrl,
//       userName: username,
//       password: password,
//     );
//     return await _apiService.register(user);
//   }
// }

import 'package:trash_panda/bloc/user_bloc.dart';
import 'package:trash_panda/models/user_model.dart';
import 'package:trash_panda/services/api_service.dart';

class UserController {
  final ApiService _apiService = ApiService();

  // ✅ Login Function
  Future<User?> login(String username, String password, [UserBloc? userBloc]) async {
    final user = await _apiService.login(username, password);
    if (user != null && userBloc != null) {
      userBloc.add(SetUserEvent(user)); // Dispatch user event to bloc
    }
    return user;
  }

  // ✅ Register Function
  Future<bool> register(String email, String profileImageUrl, String username, String password) async {
    final user = User(
      email: email,
      profileImageUrl: profileImageUrl,
      userName: username,
      password: password,
    );
    return await _apiService.register(user);
  }

  // ✅ Logout Function
  Future<void> logout() async {
    await _apiService.logout();
  }
}
