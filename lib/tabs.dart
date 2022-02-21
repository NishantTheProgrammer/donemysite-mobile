import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:mobile/screens/chats.dart';
import 'package:mobile/screens/home.dart';
import 'package:mobile/screens/orders.dart';
import 'package:mobile/screens/profile.dart';

// import 'components/custom_tabs.dart';

class Tabs extends StatefulWidget {
  Tabs({Key? key}) : super(key: key);

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  var index = 0;

  var screens = [Home(), Chats(), Orders(), Profile()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DoneMySite'),
      ),
      body: screens[index],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          iconTheme: IconThemeData(color: Colors.white, size: 25),
        ),
        child: CurvedNavigationBar(
          backgroundColor: Colors.transparent,
          animationDuration: Duration(milliseconds: 400),
          height: 60,
          index: index,
          color: Theme.of(context).colorScheme.primary,
          items: const <Widget>[
            Icon(Icons.home),
            Icon(Icons.chat_bubble),
            Icon(Icons.receipt),
            Icon(Icons.settings)
          ],
          onTap: (i) {
            setState(() {
              index = i;
            });
          },
        ),
      ),
    );
  }
}
