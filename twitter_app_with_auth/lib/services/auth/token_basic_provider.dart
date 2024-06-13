import 'dart:convert';



class TokenBasicProvider {
  late String username;
  late String password;

  TokenBasicProvider(this.username, this.password);

  String get tokenBasic =>  "Basic ${base64Encode(utf8.encode("$username:$password"))}";
}