import 'package:flutter/material.dart';
import 'package:tp_twitter/pages/home_page.dart';

import '../models/tweet.dart';

class CreateTweetPage extends StatefulWidget {
  const CreateTweetPage({super.key});

  @override
  State<CreateTweetPage> createState() => _CreateTweetPageState();
}

class _CreateTweetPageState extends State<CreateTweetPage> {
   
    // Create a global key that uniquely identifies the Form widget
   final _formKey = GlobalKey<FormState>();

  Tweet newTweet = Tweet(imageUrl: 'assets/gear5.jpg', authorName: "Quentin", postDetails: "detail", content: "Contenu par défaut");

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 31, 132, 214),
        title: Text(
          "Créer un tweet",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Form(key: _formKey, child: Column(children: [
      
        TextFormField(decoration: const InputDecoration(label: Text("Contenu du Tweet")), 
        initialValue: newTweet.content,
        validator: onValidateTweetContent, onChanged: (value) => {
          setState(() {
            newTweet.content = value;
          })
        },),
        ElevatedButton(onPressed: onSubmitForm, child: Text("Valider"))
      ],)),
    );
  }

  String? onValidateTweetContent(String? value) {

    if (value == "" || value == null) {
      return "Le contenu du Tweet doit être renseigné.";
    }
    if (value.length > 252) {
      return "Le contenu du Tweet ne peut dépasser 252 charactères";
    }
    return null;
  }

  void onSubmitForm() {
    if (_formKey.currentState!.validate()){
      Navigator.pop(context, newTweet);
    }
    else {
       ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Le formulaire n'est pas correctement renseigné.")));
    }
  }
}