
import 'package:tp_twitter/models/user.dart';

abstract class UserApi {

  List<User> login(String username, String password);


}
