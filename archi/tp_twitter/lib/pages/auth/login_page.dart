import 'package:flutter/material.dart';
import 'package:tp_twitter/constants.dart';
import 'package:tp_twitter/services/auth/auth_service.dart';
import 'package:tp_twitter/services/auth/fake_auth_service.dart';

class LoginPage extends StatefulWidget {

  AuthService authService;

  LoginPage({super.key, required this.authService});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final  TextEditingController passwordEditingController = TextEditingController(text: "password");
  final  TextEditingController userNameEditingController = TextEditingController(text: "quentin@example.com" );

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
     
      body: Center(
        child: Card(
          margin: EdgeInsets.all(20.0),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(labelText: 'Username'),
                  controller:  userNameEditingController,
                ),
                SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(labelText: 'Password'),
                  obscureText: true,
                  controller:passwordEditingController,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    try {
                    var user =  widget.authService.login(userNameEditingController.text, passwordEditingController.text);
                    
                   Navigator.pushNamedAndRemoveUntil(
                          context, ConstantsRoutes.home, (_) => false,
                          arguments: user);

                    } on Exception catch (exception) {
                         ScaffoldMessenger.of(context).showSnackBar(
                     SnackBar(content: Text(exception.toString())));
                    }
                    
                  },
                  child: Text('Login'),
                ),
                   ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, ConstantsRoutes.register);
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