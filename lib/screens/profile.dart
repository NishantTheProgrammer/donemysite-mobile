import 'package:flutter/material.dart';
import 'package:mobile/providers/auth_provider.dart';

import 'auth/login.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  final routeName = 'profile';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            'Profile',
            style: Theme.of(context).textTheme.headline4,
          ),
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
