import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final String message;
  const MyCard({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 50,
          child: Row(
            children: [

              Expanded(
                  flex: 1,
                  child: Image.asset("assets/user.png")),
              const SizedBox(width: 10,),
              Expanded(
                flex: 5,
                child: Text(
                  message,
                  style: const TextStyle(
                      fontSize: 17, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
