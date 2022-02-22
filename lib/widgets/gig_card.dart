import 'package:flutter/material.dart';

class GigCard extends StatelessWidget {
  String title;
  int price;

  GigCard({required this.title, required this.price});

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
                'https://ik.imagekit.io/ikmedia/backlit.jpg',
                // height: 100,
                fit: BoxFit.fitWidth,
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    Text(
                      '\$$price',
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
