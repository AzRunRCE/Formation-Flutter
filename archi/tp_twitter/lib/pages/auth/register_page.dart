import 'package:flutter/material.dart';
import 'package:tp_twitter/constants.dart';
import 'package:tp_twitter/models/user.dart';

import '../../services/auth/auth_service.dart';

class RegisterPage extends StatefulWidget {
  AuthService authService;

  RegisterPage({super.key, required this.authService});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController usernameEditingController =
      TextEditingController(text: "quentin");
  final TextEditingController passwordEditingController =
      TextEditingController(text: "password");
  final TextEditingController nameEditingController =
      TextEditingController(text: "quentin@example.com");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 31, 132, 214),
        title: Text(
          "Register",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Card(
          margin: EdgeInsets.all(20.0),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextField(
                  decoration: const InputDecoration(labelText: 'Username'),
                  controller: usernameEditingController,
                ),
                const TextField(
                  decoration: InputDecoration(labelText: 'Email'),
                ),
                const SizedBox(height: 10),
                const TextField(
                  decoration: InputDecoration(labelText: 'Password'),
                  obscureText: true,
                ),
               const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    try {
                      var user =  await widget.authService.register(User(usernameEditingController.text, nameEditingController.text, passwordEditingController.text) );

                      Navigator.pushNamedAndRemoveUntil(
                          context, ConstantsRoutes.home, (_) => false,
                          arguments: user);
                    } on Exception catch (exception) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(exception.toString())));
                    }
                  },
                  child: Text('Register'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
