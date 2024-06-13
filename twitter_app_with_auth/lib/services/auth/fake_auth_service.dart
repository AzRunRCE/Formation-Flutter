import 'dart:async';

import 'package:tp_twitter/models/user.dart';
import 'package:tp_twitter/services/auth/auth_service.dart';
import 'package:tp_twitter/services/auth/token_basic_provider.dart';

class FakeAuthService extends AuthService {
  Future<User>  login(String email, String password) {
    if (email == "Quentin@example.com" && password == "password") {
      return Future.value(email as FutureOr<User>?);
    }
    throw ("Mot de passe ou email incorrect");
  }

@override
  Future<User>  signup(User user) {
    return Future.value(user);
  }

  @override
  TokenBasicProvider? getCurrentToken() {
   return TokenBasicProvider("username","password");
  }

  //final String baseUrl = 'http://10.43.0.254:3001';
}
