import 'package:flutter/material.dart';
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

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("titre"),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            MyCard(cardNumber: 1),
            MyCard(cardNumber: 2),
            MyCard(cardNumber: 3),
            MyCard(cardNumber: 4),
            MyCard(cardNumber: 5),
            MyCard(cardNumber: 6),
            MyCard(cardNumber: 7),
            MyCard(cardNumber: 8),
          ],
        ),
      ),
    );
  }
}
