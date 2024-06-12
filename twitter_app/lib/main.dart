import 'package:flutter/material.dart';
import 'package:tp_twitter/content-body.dart';
import 'package:tp_twitter/footer.dart';
import 'package:tp_twitter/header.dart';

void main() {
  runApp(TPTwitterApp());
}

class TPTwitterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Twitter"),
        ),
        body: Flex(
          direction: Axis.vertical,
          children: [
            // Header
            Header(),
            // Content
            Expanded(child: ContentBody()),
            // Footer
            Footer(),
          ],
        ),
      ),
    );
  }
}
