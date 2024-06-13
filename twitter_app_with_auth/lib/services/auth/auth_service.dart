
import 'package:tp_twitter/models/user.dart';
import 'package:tp_twitter/services/auth/token_basic_provider.dart';

abstract class AuthService {

  Future<User> login(String username, String password);

  Future<User> signup(User user);
 

  TokenBasicProvider? getCurrentToken();
}
