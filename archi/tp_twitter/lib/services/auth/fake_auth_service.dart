import 'package:tp_twitter/services/auth/auth_service.dart';

import '../../models/user.dart';

class FakeAuthService extends AuthService {
  @override
  User login(String email, String password) {
    if (email == "quentin@example.com" && password == "password") {
      return User("quentin", email, "");
    }
    throw Exception("Username/Mot de passse invalide");
  }

  @override
  User register(User user) {
    return user;
  }
}
