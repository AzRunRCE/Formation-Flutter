import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final int cardNumber;
  const MyCard({super.key, required this.cardNumber});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 50,
          child: Row(
            children: [

              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Expanded(
                    flex: 1,
                    child: Image.asset("assets/user.png")),
              ),
              const SizedBox(width: 10,),
              Expanded(
                flex: 5,
                child: Text(
                  "Card n° $cardNumber",
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
