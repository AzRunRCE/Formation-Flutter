import '../models/tweet.dart';
import 'tweet_api.dart';

class FakeTweetApi implements TweetApi  {

  List<Tweet> getTweets() {
    //simulation d'un appel HTTP;

    return [Tweet(
      imageUrl: 'assets/gear5.jpg',
      authorName: '@Luffy',
      postDetails: '50s',
      content:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam pharetra ligula ut tincidunt fringilla. Vivamus id lacus ipsum. Mauris congue sodales arcu sit amet interdum. Etiam gravida consectetur porttitor. Mauris eget sem interdum, sagittis leo vitae, feugiat urna. Aliquam tempus dictum ornare. Vestibulum ut eros non ipsum ultricies elementum vitae ac diam. Sed vitae velit in neque pulvinar consectetur.',
    ),
    Tweet(
      imageUrl: 'assets/gear5.jpg',
      authorName: '@Luffy',
      postDetails: '50s',
      content:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam pharetra ligula ut tincidunt fringilla. Vivamus id lacus ipsum. Mauris congue sodales arcu sit amet interdum. Etiam gravida consectetur porttitor. Mauris eget sem interdum, sagittis leo vitae, feugiat urna. Aliquam tempus dictum ornare. Vestibulum ut eros non ipsum ultricies elementum vitae ac diam. Sed vitae velit in neque pulvinar consectetur.',
    ),
     Tweet(
      imageUrl: 'assets/gear5.jpg',
      authorName: '@Quentin',
      postDetails: '120m',
      content:
         'demo invertion dépendances archi',
    )
    
    ];
  }

}

