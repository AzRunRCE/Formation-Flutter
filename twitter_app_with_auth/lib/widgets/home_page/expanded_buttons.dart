import 'package:flutter/material.dart';

class ExpandedButton extends StatefulWidget {
  final String? text;
  final Icon? icon;
  final void Function()? onPressed;

  const ExpandedButton({Key? key, this.text, this.icon, required this.onPressed}) : super(key: key);

  @override
  State<ExpandedButton> createState() => _ExpandedButtonState();
}

class _ExpandedButtonState extends State<ExpandedButton> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: TextButton(
        onPressed: widget.onPressed,
        child: widget.icon ?? Text(
          widget.text ?? '',
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}