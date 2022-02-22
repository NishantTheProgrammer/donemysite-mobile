import 'package:flutter/material.dart';
import 'package:mobile/widgets/gig_card.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  final routeName = 'home';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 4.0,
        mainAxisSpacing: 4.0,
        childAspectRatio: MediaQuery.of(context).size.width /
            (MediaQuery.of(context).size.height / 1.31),
        children: List.generate(20, (index) {
          return GigCard(
            title:
                'Find Django and Python permanent, contract and freelance jobs',
            price: 30,
          );
        }),
      ),
    );
  }
}
