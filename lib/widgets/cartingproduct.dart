import 'package:ecommerce_app/screens/cartscreen.dart';
import 'package:flutter/material.dart';

class CartSingleProduct extends StatefulWidget {
  int quantity;
  final String name;
  final String image;
  final String price;
  bool isCount;

  const CartSingleProduct(
      {Key key, this.quantity, this.name, this.image, this.price, this.isCount})
      : super(key: key);

  @override
  _CartSingleProductState createState() => _CartSingleProductState();
}

TextStyle myStyle = TextStyle(fontSize: 18);

class _CartSingleProductState extends State<CartSingleProduct> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: double.infinity,
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  height: 130,
                  width: 150,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill, image: NetworkImage(widget.image))),
                ),
                Container(
                  height: 140,
                  width: 200,
                  child: ListTile(
                    title: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(widget.name),
                          ],
                        ),
                        Text("Cloths"),
                        Text(
                          "${widget.price.toString()}",
                          style: TextStyle(
                              color: Color(0xff9b96d6),
                              fontWeight: FontWeight.bold),
                        ),
                        Container(
                            height: 35,
                            width: widget.isCount == false ? 120 : 100,
                            color: Color(0xfff2f2f2),
                            child: widget.isCount == false
                                ? Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      GestureDetector(
                                        child: Icon(Icons.remove),
                                        onTap: () {
                                          setState(() {
                                            if (widget.quantity > 1) {
                                              widget.quantity--;
                                            }
                                          });
                                        },
                                      ),
                                      Text(
                                        widget.quantity.toString(),
                                        style: myStyle,
                                      ),
                                      GestureDetector(
                                        child: Icon(Icons.add),
                                        onTap: () {
                                          setState(() {
                                            widget.quantity++;
                                            productProvider.getCountData(
                                              count: widget.quantity,
                                            );
                                          });
                                        },
                                      ),
                                    ],
                                  )
                                : Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                        Text("Quantity"),
                                        Text(
                                          productProvider.getCountData.toString(),
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      ])),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
