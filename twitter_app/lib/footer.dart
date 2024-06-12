
import 'package:flutter/material.dart';

class FooterButton extends StatelessWidget {

  String label;
  bool active = false;

  FooterButton(this.label, {this.active = false});

  Color getColor(){
    return (active) ? Color(0xFF58B0F0) : Colors.grey;
  }

  @override
  Widget build(BuildContext context) {
    return  Expanded(
        child: Text(
          this.label,
          textAlign: TextAlign.center,
          style: TextStyle(color: getColor()),
        ));
  }
}

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return   Container(
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Flex(
          direction: Axis.horizontal,
          children: [
            FooterButton("Fil", active : true),
            FooterButton("Notification"),
            FooterButton("Message"),
            FooterButton("Moi"),
          ],
        ),
      ),
    );
  }
  
}