// custom_bottom_bar.dart
import 'package:flutter/material.dart';

class CustomBottomBar extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  CustomBottomBar({required this.selectedIndex, required this.onItemTapped});

  @override
  _CustomBottomBarState createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Fil',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications),
          label: 'Notifications',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.mail),
          label: 'Messages',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Moi',
        ),
      ],
      currentIndex: widget.selectedIndex,
      unselectedItemColor: Colors.grey,
      selectedItemColor: Color(0xFF58B0F0),
      onTap: widget.onItemTapped,
    );
  }
}