import 'package:flutter/material.dart';
import 'package:tp_twitter/constants.dart';
import 'package:tp_twitter/pages/create_tweet_page.dart';
import 'package:tp_twitter/pages/home_page.dart';

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
      initialRoute: '/',
      routes: {
        ConstantsRoutes.home: (context) => const MyHomePage(title: "Twiter",),
        ConstantsRoutes.newTweet: (context) => const CreateTweetPage()
      },
    );
  }
}