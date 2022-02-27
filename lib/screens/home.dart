import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:mobile/main.dart';
import 'package:mobile/models/gig.dart';
import 'package:mobile/providers/gig_provider.dart' as gig_provider;
import 'package:mobile/widgets/gig_card.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  static const routeName = 'home';

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Gig> gigs = [];

  @override
  void initState() {
    gig_provider.all().then((gigs) {
      setState(() {
        this.gigs = gigs;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.all(8.0),
      crossAxisCount: 2,
      crossAxisSpacing: 4.0,
      mainAxisSpacing: 4.0,
      childAspectRatio: 8.0 / 12.5,
      children: gigs.map((gig) => GigCard(gig)).toList(),
    );
  }
}
