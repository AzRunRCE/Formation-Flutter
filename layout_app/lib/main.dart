import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:layout_app/widgets/my_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> messages = ["Bonjour", "Comment tu vas ?"];

  final inputTextController = TextEditingController();

  onSendMessage() {
    setState(() {
      messages.add(inputTextController.text);
    });
    inputTextController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("titre"),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: Column(
              children: messages.map((msg) => MyCard(message: msg)).toList(),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                        controller: inputTextController,
                        decoration: InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: "Votre message")),
                  ),
                  ElevatedButton(onPressed: onSendMessage, child: Text("Envoyer"))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
