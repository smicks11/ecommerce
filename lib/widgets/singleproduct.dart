import 'package:flutter/material.dart';

class SingleProduct extends StatelessWidget {
  final String image;
  final String price;
  final String name;

  const SingleProduct({Key key, this.image, this.price, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 220,
        width: 150,
        child: Column(
          children: [
            Container(
              height: 160,
              width: 130,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(image),
                ),
              ),
            ),
            Text(
              price,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: Color(0xff9b96d6)),
            ),
            Container(
              child: Text(
                name,
                style: TextStyle(fontSize: 17),
              ),
            )
          ],
        ),
      ),
    );
  }
}
