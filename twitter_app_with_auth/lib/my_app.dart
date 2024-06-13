import 'package:flutter/material.dart';
import 'package:tp_twitter/models/constants_routes.dart';
import 'package:tp_twitter/services/auth/api_auth_service.dart';
import 'package:tp_twitter/services/tweet/api_tweet_service.dart';
import 'package:tp_twitter/views/create_tweet_page.dart';
import 'package:tp_twitter/views/home_page.dart';
import 'package:tp_twitter/views/login_page.dart';
import 'package:tp_twitter/views/signup_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var authService = ApiAuthService(ConstantsSettings.host);
    var tweetService = ApiTweetService(ConstantsSettings.host, authService);

    return MaterialApp(
      title: 'My Twitter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: ConstantsRoutes.home,
      routes: {
        ConstantsRoutes.home: (context) => MyHomePage(title: "Twitter", tweetService: tweetService, authService: authService,),
        ConstantsRoutes.createTweet: (context) => CreateTweetPage(tweetService: tweetService),
        ConstantsRoutes.login: (context) => LoginPage(authService: authService),
        ConstantsRoutes.signup: (context) => SignupPage(authService:authService,),
      },
    );
  }
}