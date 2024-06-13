import 'package:flutter/material.dart';
import 'package:tp_twitter/models/tweet.dart';
import 'package:readmore/readmore.dart';
import 'package:intl/intl.dart';

class TweetCard extends StatelessWidget {
  final Tweet tweet;

  TweetCard({required this.tweet});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          ListTile(
            leading: const CircleAvatar(
              backgroundImage:
                  NetworkImage("https://picsum.photos/250?image=9"),
            ),
            title: Text(tweet.username),
            trailing: Text(DateFormat('d MMMM yyyy')
                .format(DateTime.parse(tweet.timestamp))),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ReadMoreText(
              tweet.content,
              trimLines: 3,
              colorClickableText: const Color.fromARGB(255, 31, 132, 214),
              trimMode: TrimMode.Line,
              trimCollapsedText: '...Lire la suite',
              trimExpandedText: ' moins',
            ),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: const Color.fromARGB(255, 31, 132, 214),
                ),
                child: const Text('Répondre'),
                onPressed: () {/* ... */},
              ),
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: const Color.fromARGB(255, 31, 132, 214),
                ),
                child: const Text('Retweet'),
                onPressed: () {/* ... */},
              ),
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: const Color.fromARGB(255, 31, 132, 214),
                ),
                child: const Text('Favoris'),
                onPressed: () {/* ... */},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
