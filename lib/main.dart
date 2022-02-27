import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mobile/models/contact.dart';
import 'package:mobile/screens/auth/login.dart';
import 'package:mobile/screens/chat_details.dart';
import 'package:mobile/screens/chats.dart';
import 'package:mobile/screens/home.dart';
import 'package:mobile/screens/orders.dart';
import 'package:mobile/screens/profile.dart';

import 'tabs.dart';

const baseURL = 'https://nishanttheprogrammer.pythonanywhere.com/api';
final storage = FlutterSecureStorage();

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
        // routes: routes,
        onGenerateRoute: (RouteSettings settings) {
          var routes = <String, WidgetBuilder>{
            Login.routeName: (context) => Login(),
            Home.routeName: (context) => Tabs(index: 0),
            Chats.routeName: (context) => Tabs(index: 1),
            Orders.routeName: (context) => Tabs(index: 2),
            Profile.routeName: (context) => Tabs(index: 3),
            ChatDetails.routeName: (context) =>
                ChatDetails(settings.arguments as Contact),
          };

          WidgetBuilder? builder = routes[settings.name];
          return MaterialPageRoute(builder: (ctx) => builder!(ctx));
        });
  }
}
