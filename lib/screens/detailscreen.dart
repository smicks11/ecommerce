// import 'package:ecommerce_app/screens/cartscreen.dart';
import 'package:ecommerce_app/provider/product_provider.dart';
import 'package:ecommerce_app/screens/cartscreen.dart';
import 'package:ecommerce_app/screens/homepage.dart';
import 'package:ecommerce_app/widgets/myButton.dart';
import 'package:ecommerce_app/widgets/notification_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatefulWidget {
  final String image;
  final String name;
  final String price;

  const DetailScreen({Key key, this.image, this.name, this.price})
      : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int count = 1;
  ProductProvider productProvider;
  Widget _buildSizeProduct(String name) {
    return Container(
      height: 60,
      width: 60,
      color: Color(0xfff2f2f2),
      child: Center(
          child: Text(
        name,
        style: TextStyle(fontSize: 17),
      )),
    );
  }

  final TextStyle myStyle = TextStyle(
    fontSize: 18,
  );

  Widget _buildColorProduct(Color color) {
    return Container(
      height: 60,
      width: 60,
      color: color,
    );
  }

  @override
  Widget build(BuildContext context) {
    productProvider = Provider.of<ProductProvider>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Detail Page", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (ctx) => HomePage()));
          },
        ),
        actions: [
          NotificationButton(),
        ],
      ),
      body: Container(
        child: ListView(
          children: [
            Column(
              children: [
                Center(
                  child: Row(
                    children: [
                      Container(
                        width: 200,
                        child: Card(
                          child: Container(
                            padding: EdgeInsets.all(13),
                            child: Container(
                              height: 220,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(widget.image))),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 100,
                        child: Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(widget.name, style: myStyle),
                                Text(
                                  widget.price,
                                  style: TextStyle(
                                      fontSize: 18, color: Color(0xff9b96d6)),
                                ),
                                Text("Description", style: myStyle),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 170,
                        child: Wrap(
                          children: [
                            Text(
                              "This ${widget.name} is unisex and of great material that will be durable for a long period of time. Our Prices are best affordable. It's a designer hoodie that will shield cold from afecting your skin. This Hoodie is unisex and of great material that will be durable for a long period of time. Our Prices are best affordable. It's a designer hoodie that will shield cold from afecting your skin. Our Prices are best affordable.",
                              style: TextStyle(fontSize: 16),
                            )
                          ],
                        ),
                      ),
                      Text(
                        "Size",
                        style: TextStyle(fontSize: 15),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: 265,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                                onTap: () {}, child: _buildSizeProduct("S")),
                            _buildSizeProduct("M"),
                            _buildSizeProduct("L"),
                            _buildSizeProduct("XXL"),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Color",
                        style: TextStyle(fontSize: 15),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: 265,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _buildColorProduct(Colors.blue[200]),
                            _buildColorProduct(Colors.green[200]),
                            _buildColorProduct(Colors.yellow[200]),
                            _buildColorProduct(Colors.red),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Quantity",
                        style: myStyle,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 40,
                        width: 130,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.blue[200]
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              child: Icon(Icons.remove),
                              onTap: () {
                                setState(() {
                                  if (count > 1) {
                                    count--;
                                  }
                                });
                              },
                            ),
                            Text(
                              count.toString(),
                              style: myStyle,
                            ),
                            GestureDetector(
                              child: Icon(Icons.add),
                              onTap: () {
                                setState(() {
                                  count++;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 60,
                        child: MyButton(
                          name: "CheckOut",
                          onPressed: () {
                            productProvider.getCartData(
                                      image: widget.image,
                                      name: widget.name,
                                      price: widget.price,
                                      quantity: count);
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (ctx) => CartScreen(),
                                    ),
                                  );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
