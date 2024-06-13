import 'dart:convert';
import 'package:tp_twitter/models/tweet.dart';
import 'package:tp_twitter/services/auth/auth_service.dart';
import 'package:tp_twitter/services/auth/token_basic_provider.dart';
import 'package:tp_twitter/services/tweet/tweet_service.dart';
import 'package:http/http.dart' as http;

class ApiTweetService implements TweetService {
  http.Client client = http.Client();
 
  final String hostUrl;
  final AuthService authService;
  ApiTweetService(this.hostUrl, this.authService);


  @override
  Future<List<Tweet>> getTweets() async {

    var response = await http.get(
      Uri.parse("$hostUrl/tweets"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        "Authorization":  "${authService.getCurrentToken()?.tokenBasic}"
      },
    );

    if (response.statusCode == 200) {
      Iterable list = jsonDecode(response.body);
      return list.map((model) => Tweet.fromJson(model)).toList();
    } else {
      throw Exception('Failed to load tweets');
    }
  }

  Future<Tweet> addTweet(Tweet tweet) async {
    var response = await http.post(
      Uri.parse("$hostUrl/tweets"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        "Authorization":  "${authService.getCurrentToken()?.tokenBasic}"
      },
      body: jsonEncode(tweet.toJson()),
    );

    if (response.statusCode == 201) {
      return Tweet.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create tweet');
    }
  }
}
