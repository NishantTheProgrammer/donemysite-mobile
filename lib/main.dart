import 'package:flutter/material.dart';
import 'package:mobile/screens/auth/login.dart';
import 'package:mobile/screens/chats.dart';
import 'package:mobile/screens/home.dart';
import 'package:mobile/screens/orders.dart';
import 'package:mobile/screens/profile.dart';

import 'tabs.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final routes = {
    Login().routeName: (context) => Login(),
    Home().routeName: (context) => Tabs(index: 0),
    Chats().routeName: (context) => Tabs(index: 1),
    Orders().routeName: (context) => Tabs(index: 2),
    Profile().routeName: (context) => Tabs(index: 3),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.purple,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        appBarTheme: AppBarTheme(backgroundColor: Colors.purple),
        primarySwatch: Colors.purple,
      ),
      home: Tabs(),
      routes: routes,
    );
  }
}
