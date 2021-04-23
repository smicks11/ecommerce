import 'package:ecommerce_app/provider/product_provider.dart';
import 'package:ecommerce_app/widgets/cartingproduct.dart';
import 'package:ecommerce_app/widgets/notification_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckOut extends StatefulWidget {
  @override
  _CheckOutState createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  TextStyle myStyle = TextStyle(
    fontSize: 18,
  );

  ProductProvider productProvider;

  Widget _buildBottomDetail({String startName, String endName}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          startName,
          style: myStyle,
        ),
        Text(
          endName,
          style: myStyle,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    productProvider = Provider.of<ProductProvider>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("CheckOut Page", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
        actions: [
          NotificationButton(),
        ],
      ),
      bottomNavigationBar: Container(
        height: 70,
        width: 100,
        margin: EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.only(bottom: 10),
        child: RaisedButton(
            color: Color(0xff746bc9),
            child: Text("Buy",
                style: TextStyle(color: Colors.white, fontSize: 18)),
            onPressed: () {}),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListView.builder(
          itemCount: productProvider.getCartModelListLength,
          itemBuilder: (ctx, index) {
              return CartSingleProduct(
                      image: productProvider.getCartModelList[index].image,
                      name: productProvider.getCartModelList[index].name,
                      price: productProvider.getCartModelList[index].price,
                      quantity: productProvider.getCartModelList[index].quantity,
              );}) ,   
              Container(
                height: 150,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    
                    _buildBottomDetail(
                        startName: "Your Price", endName: "N6,000"),
                    _buildBottomDetail(startName: "Discount", endName: "3%"),
                    _buildBottomDetail(
                        startName: "Shipping", endName: "N3,000"),
                    _buildBottomDetail(startName: "Total", endName: "N9,000"),
                  ],
                ),
              )
            ],
          ),
      ),
    );
  }
}
