import 'package:flutter/material.dart';

class CustomTabs extends StatelessWidget {
  const CustomTabs({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Calls',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat),
          label: 'Camera',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Chats',
        ),
      ],
    );
  }
}
