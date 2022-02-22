import 'package:flutter/material.dart';
import 'package:mobile/models/gig.dart';

class GigCard extends StatelessWidget {
  final Gig gig;

  GigCard(this.gig);

  void _gigDetails() {
    debugPrint('Card tapped.');
  }

  void _share() {
    debugPrint('Card tapped.');
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
        20,
      )),
      child: InkWell(
        onTap: _gigDetails,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                gig.photo,
                height: 120,
                fit: BoxFit.fitHeight,
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      gig.title,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    Text(
                      '\$${gig.price}',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: _gigDetails,
                          child: Text('Order'),
                        ),
                        IconButton(onPressed: _share, icon: Icon(Icons.share)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
