import 'package:flutter/material.dart';
import 'package:mobile/components/custom_tabs.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text("hello"),
      bottomNavigationBar: CustomTabs(),
    );
  }
}
