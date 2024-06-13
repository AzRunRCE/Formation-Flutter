import '../../models/user.dart';

abstract class AuthService {

    Future<User>  login(String username, String  password);

    Future<User> register(User user);

}

