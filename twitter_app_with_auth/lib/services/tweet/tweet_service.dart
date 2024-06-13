import 'package:tp_twitter/models/tweet.dart';

abstract class TweetService {
  Future<List<Tweet>> getTweets();

  Future<Tweet> addTweet(Tweet newTweet);
}
