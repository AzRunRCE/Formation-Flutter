import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:tp_twitter/models/constants_routes.dart';
import 'package:tp_twitter/models/tweet.dart';
import 'package:tp_twitter/services/auth/auth_service.dart';
import 'package:tp_twitter/services/tweet/tweet_service.dart';
import 'package:tp_twitter/widgets/cards/tweet_card.dart';
import 'package:tp_twitter/widgets/header/custom_app_bar.dart';
import 'package:tp_twitter/widgets/footer/custom_bottom_bar.dart';
import 'package:tp_twitter/widgets/home_page/expanded_buttons.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage(
      {super.key,
      required this.title,
      required this.tweetService,
      required this.authService});

  final TweetService tweetService;
  final AuthService authService;
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  List<Tweet> tweets = [];

  bool isLoading = true;

  void updateIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
      super.initState();
      if (widget.authService.getCurrentToken() == null) {
          SchedulerBinding.instance.addPostFrameCallback((_) {
        Navigator.pushNamed(
            context, ConstantsRoutes.login);
        });
      
    } else {
      widget.tweetService.getTweets().then((value) {
        setState(() {
          tweets = value;
          isLoading = false;
        });
      }).catchError((onError) {
        setState(() {
          tweets = [];
          isLoading = false;
        });
      }); 
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: widget.title),
      body: isLoading ?
           const CircularProgressIndicator.adaptive()
          : RenderBody(context),
      bottomNavigationBar: CustomBottomBar(
          selectedIndex: _selectedIndex, onItemTapped: (index) => {}),
    );
  }

  Column RenderBody(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 50.0,
          color: Color(0xFF58B0F0),
          child: Row(
            children: [
              ExpandedButton(
                  icon: const Icon(Icons.edit, color: Colors.white),
                  onPressed: () => onClickNewTweet(context)),
              ExpandedButton(
                  text: "Accueil", onPressed: () => onClickNewTweet(context)),
              ExpandedButton(
                  icon: const Icon(Icons.search, color: Colors.white),
                  onPressed: () => onClickNewTweet(context)),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: tweets.length,
            itemBuilder: (context, index) {
              return TweetCard(tweet: tweets[index]);
            },
          ),
        ),
      ],
    );
  }

  void onClickNewTweet(BuildContext context) {
    Navigator.pushNamed(context, '/create-tweet').then((newTweet) {
      if (newTweet != null) {
        setState(() {
          //tweetService.addTweet(newTweet as Tweet);
        });
      }
    });
  }
}
