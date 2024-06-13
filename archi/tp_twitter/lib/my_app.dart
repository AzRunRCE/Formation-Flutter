import 'package:flutter/material.dart';
import 'package:tp_twitter/constants.dart';
import 'package:tp_twitter/pages/auth/login_page.dart';
import 'package:tp_twitter/pages/auth/register_page.dart';
import 'package:tp_twitter/pages/create_tweet_page.dart';
import 'package:tp_twitter/pages/home_page.dart';
import 'package:tp_twitter/services/auth/api_auth_service.dart';
import 'package:tp_twitter/services/auth/fake_auth_service.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute:   ConstantsRoutes.login,
      routes: {
        ConstantsRoutes.home: (context) => const MyHomePage(title: "Twiter",),
        ConstantsRoutes.newTweet: (context) => const CreateTweetPage(),
        ConstantsRoutes.login: (context) => LoginPage(authService: ApiAuthService(ConstantsRoutes.host),),
        ConstantsRoutes.register: (context) => RegisterPage(authService: ApiAuthService(ConstantsRoutes.host))
      },
      
    );
  }
}