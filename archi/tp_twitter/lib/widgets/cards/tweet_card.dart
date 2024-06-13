import 'package:flutter/material.dart';
import 'package:tp_twitter/pages/home_page.dart';

import '../../models/tweet.dart';

class TweetCard extends StatelessWidget {
  final Tweet tweet;


  TweetCard(this.tweet);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(tweet.imageUrl),
                      fit: BoxFit
                          .cover,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: ListTile(
                    title: Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: Row(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(tweet.authorName),
                              Container(
                                margin: const EdgeInsets.only(left: 8.0),
                                child: const Icon(
                                  Icons.verified,
                                  size: 18.0,
                                  color: Color.fromARGB(255, 31, 132, 214),
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          Text(tweet.postDetails),
                        ],
                      ),
                    ),
                    subtitle: Text(tweet.content),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: OverflowBar(
              alignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Color.fromARGB(255, 31, 132, 214),
                  ),
                  child: const Text('Répondre'),
                  onPressed: () {/* ... */},
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Color.fromARGB(255, 31, 132, 214),
                  ),
                  child: const Text('Retweet'),
                  onPressed: () {/* ... */},
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Color.fromARGB(255, 31, 132, 214),
                  ),
                  child: const Text('Favoris'),
                  onPressed: () {/* ... */},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
