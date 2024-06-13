import 'dart:convert';

import 'package:tp_twitter/models/user.dart';
import 'package:tp_twitter/services/auth/auth_service.dart';
import 'package:http/http.dart' as http;

class ApiAuthService implements AuthService {

  final String hostUrl = "http://localhost:3001"; 

  @override
  Future<User> login(String username, String password) async {
    return Future.value(User(username,"", password));
  }

  @override
  Future<User> register(User user) async {
     var response =  await http.post(Uri(host: hostUrl,path: "/users"), body: user.toJson());
    if (response.statusCode == 200){
        return  Future.value( User.fromJson(jsonDecode(response.body) as Map<String, dynamic>));
    }
    throw  Exception("Register failed");
  }

  
}