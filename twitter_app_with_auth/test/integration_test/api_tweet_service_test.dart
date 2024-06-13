import 'package:flutter_test/flutter_test.dart';
import 'package:tp_twitter/services/auth/fake_auth_service.dart';
import 'package:tp_twitter/services/tweet/api_tweet_service.dart';

void main() {
  test('getTweets returns a list', () async {
    final apiTweetService = ApiTweetService("null",FakeAuthService());

    final tweets = await apiTweetService.getTweets();

    expect(tweets, isA<List>());
  });
  
}