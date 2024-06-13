import 'package:tp_twitter/services/auth/auth_service.dart';

import '../../models/user.dart';

class FakeAuthService extends AuthService {
  @override
  Future<User> login(String email, String password) {
    if (email == "quentin@example.com" && password == "password") {
      return Future.value(User("quentin", email, ""));
    }
    throw Exception("Username/Mot de passse invalide");
  }

  @override
  Future<User> register(User user) {
    return Future.value(user);
  }
}
