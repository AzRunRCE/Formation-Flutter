import 'package:flutter/material.dart';
import 'package:tp_twitter/api/fake_tweet_api.dart';
import 'package:tp_twitter/constants.dart';
import 'package:tp_twitter/pages/create_tweet_page.dart';
import 'package:tp_twitter/services/tweet_service.dart';
import 'package:tp_twitter/widgets/cards/tweet_card.dart';

import '../models/tweet.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  List<Tweet> tweets = [];

  @override
  void initState() {
    tweets = TweetService(FakeTweetApi()).GetTweetsByUser("@Quentin");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 31, 132, 214),
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 50.0,
            color: Color(0xFF58B0F0),
            child: Row(
              children: [
                buildExpanded("Nouveau", () => onClickNewClick(context)),
                buildExpanded("Accueil", _addNewTweet),
                buildExpanded("Rechercher", null),
              ],
            ),
          ),
          Expanded(
              child: ListView(
                  children: tweets.map((tweet) => TweetCard(tweet)).toList())),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Fil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Moi',
          ),
        ],
        currentIndex: _selectedIndex,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Color(0xFF58B0F0),
        onTap: _onItemTapped,
      ),
    );
  }

  void _addNewTweet() {
    setState(() {
      tweets = [
        Tweet(
            imageUrl: 'assets/gear5.jpg',
            authorName: "authorName",
            postDetails: "postDetails",
            content: "content"),
        ...tweets
      ];
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      print(_selectedIndex);
    });
  }

  Expanded buildExpanded(String text, VoidCallback? onPress) {
    return Expanded(
      flex: 1,
      child: TextButton(
        onPressed: onPress,
        child: Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  void onClickNewClick(BuildContext context) {
    Navigator.pushNamed(
            context, ConstantsRoutes.newTweet)


//Lambda one line
        /*.then((newTweet) => setState(() {
           tweets = [newTweet as Tweet, ...tweets];
    }));*/


//Lambda avec corps de méthode
        .then((newTweet) {
            setState(() {
             tweets = [newTweet as Tweet, ...tweets];
            });
    });
  }
}
