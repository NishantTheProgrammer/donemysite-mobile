import 'package:flutter/material.dart';
import 'package:mobile/screens/auth/login.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  final routeName = 'home';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text('Home'),
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
