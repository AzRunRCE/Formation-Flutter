import 'dart:convert';

import 'package:tp_twitter/models/user.dart';
import 'package:tp_twitter/services/auth/auth_service.dart';
import 'package:http/http.dart' as http;

class ApiAuthService implements AuthService {
  ApiAuthService(this.hostUrl);

  final String hostUrl;

  @override
  Future<User> login(String username, String password) async {
    String tokenBasic = "$username:$password";
    var response =
        await http.get(Uri.parse("$hostUrl/users"), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      "Authorization": 'Basic ${base64Encode(tokenBasic.codeUnits)}'
    });

    if (response.statusCode == 200) {
      return Future.value(
          User(username, "", password));
    }
    throw Exception("Login failed, please retry");
  }

  @override
  Future<User> register(User user) async {
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
}
