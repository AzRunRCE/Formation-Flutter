import 'dart:convert';

import 'package:tp_twitter/models/user.dart';
import 'package:tp_twitter/services/auth/auth_service.dart';
import 'package:http/http.dart' as http;
import 'package:tp_twitter/services/auth/token_basic_provider.dart';

class ApiAuthService implements AuthService {
  ApiAuthService(this.hostUrl);

  final String hostUrl;

  static TokenBasicProvider? _currentToken;

  @override
  Future<User> login(String username, String password) async {
    TokenBasicProvider tokenBasicProvider = TokenBasicProvider(username,password);
    var response =
        await http.get(Uri.parse("$hostUrl/users"), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      "Authorization":  tokenBasicProvider.tokenBasic
    });

    if (response.statusCode == 200) {
      _currentToken = tokenBasicProvider;
      return Future.value(
          User(username, "", password));
    }
    throw Exception("Login failed, please retry");
  }

  @override
  Future<User> signup(User user) async {
    var response = await http.post(Uri.parse("$hostUrl/users"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(user.toJson()));
    if (response.statusCode == 201) {
      return Future.value(
          User.fromJson(jsonDecode(response.body) as Map<String, dynamic>));
    }
    throw Exception("Register failed");
  }

  @override
  TokenBasicProvider? getCurrentToken() {
    return  _currentToken;
  }
}