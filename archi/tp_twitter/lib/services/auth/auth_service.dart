import '../../models/user.dart';

abstract class AuthService {

    User login(String username, String  password);

    User register(User user);

}

