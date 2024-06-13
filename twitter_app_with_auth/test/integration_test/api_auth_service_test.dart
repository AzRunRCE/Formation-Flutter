import 'package:flutter_test/flutter_test.dart';
import 'package:tp_twitter/models/user.dart';
import 'package:tp_twitter/services/auth/api_auth_service.dart';

void main() {
  test('should register new user', () async {
    //Setup
    var service = ApiAuthService("http://10.43.0.254:3001");

    //Action
    var result = await service.signup(User("antonio", "antonio", "antonio"));

    //Result
    expect(result, isNotNull);
  });

  test('when user exist should return user', () async {
    var service = ApiAuthService("http://10.43.0.254:3001");

    var result = await service.login("antonio", "antonio");

    expect(result, isNotNull);
  });
}
