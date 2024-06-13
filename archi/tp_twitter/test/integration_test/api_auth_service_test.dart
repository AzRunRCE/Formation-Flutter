// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tp_twitter/api/tweet_api.dart';
import 'package:tp_twitter/models/tweet.dart';
import 'package:tp_twitter/models/user.dart';

import 'package:tp_twitter/my_app.dart';
import 'package:tp_twitter/services/auth/api_auth_service.dart';
import 'package:tp_twitter/services/tweet_service.dart';

void main() {
  //GIVEN two tweet from @userA, and one from  @userB,
  //WHEN getTweetByUser("@userA")
  //THEN should return 2
  test('should register new User', () async {

    var service = ApiAuthService("http://localhost:3001");
    var result = await service.register(User("usernameTest2", "Test User2", "password123"));
    expect(result, isNotNull);

  });




  test('when user exist should return user', () async {

    var service = ApiAuthService("http://localhost:3001");


    var result = await service.login("usernameTest2", "password123");


    expect(result, isNotNull);

  });

}

class InMemoryTweetApi extends TweetApi {
  List<Tweet> tweets;

  InMemoryTweetApi(this.tweets);

  @override
  List<Tweet> getTweets() {
    return tweets;
  }
}
