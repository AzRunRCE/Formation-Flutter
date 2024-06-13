import 'package:flutter/animation.dart';
import 'package:tp_twitter/api/fake_tweet_api.dart';

import '../api/tweet_api.dart';
import '../models/tweet.dart';

class TweetService {
  TweetService(this.tweetApi);
  
  TweetApi tweetApi;

  List<Tweet> GetTweetsByUser(String user) {
    return tweetApi.getTweets().where((tw) => tw.authorName == user).toList();
  }
}
