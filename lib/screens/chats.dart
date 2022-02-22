import 'package:flutter/material.dart';

import 'auth/login.dart';

class Chats extends StatelessWidget {
  const Chats({Key? key}) : super(key: key);

  final routeName = 'chats';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text('Chats'),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, Login().routeName);
            },
            child: Text('Login'),
          )
        ],
      ),
    );
  }
}
