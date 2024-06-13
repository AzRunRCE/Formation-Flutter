import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tp_twitter/models/tweet.dart';
import 'package:tp_twitter/services/tweet/tweet_service.dart';
import 'package:tp_twitter/widgets/header/custom_app_bar.dart';

class CreateTweetPage extends StatefulWidget {
  const CreateTweetPage({Key? key, required this.tweetService})
      : super(key: key);

  final TweetService tweetService;

  @override
  State<CreateTweetPage> createState() => _CreateTweetPageState();
}

class _CreateTweetPageState extends State<CreateTweetPage> {
  final _formKey = GlobalKey<FormState>();
  Tweet newTweet = Tweet(0, "", "", "", 0, 0);

  @override
  void initState() {
    super.initState();
    _loadUsername();
  }

  Future<void> _loadUsername() async {
    final prefs = await SharedPreferences.getInstance();
    final username = prefs.getString('username') ?? '';
    setState(() {
      newTweet.username = username;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Créer un tweet"),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              decoration:
                  const InputDecoration(label: Text("Contenu du Tweet")),
              onSaved: (String? value) {
                newTweet.content = value!;
              },
              validator: onValidateTweetContent,
            ),
            ElevatedButton(
              onPressed: onSubmitForm,
              child: const Text("Créer le tweet"),
            ),
          ],
        ),
      ),
    );
  }

  String? onValidateTweetContent(String? value) {
    if (value == null || value.isEmpty) {
      return 'Le contenu du tweet ne peut pas être vide.';
    }
    if (value.length > 252) {
      return 'Le contenu du tweet ne peut pas dépasser 252 caractères.';
    }
    return null;
  }

  void onSubmitForm() async {
    final form = _formKey.currentState;

    if (form!.validate()) {
      form.save();
      try {
        await widget.tweetService.addTweet(newTweet);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Tweet créé avec succès')),
        );
        Navigator.pushNamedAndRemoveUntil(context, "/", (_) => false);
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erreur lors de la création du tweet: $e')),
        );
      }
    }
  }
}
