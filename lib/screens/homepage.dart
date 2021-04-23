// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/model/categoryicon.dart';
import 'package:ecommerce_app/model/product.dart';
import 'package:ecommerce_app/provider/category_provider.dart';
import 'package:ecommerce_app/provider/product_provider.dart';
import 'package:ecommerce_app/screens/detailscreen.dart';
import 'package:ecommerce_app/screens/list_product.dart';
import 'package:ecommerce_app/widgets/notification_button.dart';
import 'package:ecommerce_app/widgets/singleproduct.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

Product menData;
CategoryProvider categoryProvider;
ProductProvider productProvider;

Product womenData;
var featureSnapShot;
var newAchivesSanpShot;
var tie;
var shoes;
var pant;
var dress;
var shirt;

Product bulbData;

Product smartPhoneData;

class _HomePageState extends State<HomePage> {
  Widget _buildCategoryProduct(String image, int color) {
    return CircleAvatar(
      maxRadius: 32,
      backgroundColor: Color(color),
      backgroundImage: NetworkImage(image),
    );
  }

  bool homeColor = true;

  bool cartColor = false;

  bool aboutColor = false;

  bool contactUsColor = false;

  Widget _buildMyDrawer() {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              "James Peter",
              style: TextStyle(color: Colors.black),
            ),
            currentAccountPicture: CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage("images/hoodie.jpg"),
            ),
            decoration: BoxDecoration(color: Color(0xfff2f2f2)),
            accountEmail: Text(
              "Jamespeter2225@gmail.com",
              style: TextStyle(color: Colors.black),
            ),
          ),
          ListTile(
            selected: homeColor,
            onTap: () {
              setState(() {
                homeColor = true;
                contactUsColor = false;
                cartColor = false;
                aboutColor = false;
              });
            },
            leading: Icon(Icons.home),
            title: Text("Home"),
          ),
          ListTile(
            selected: cartColor,
            onTap: () {
              setState(() {
                cartColor = true;
                contactUsColor = false;
                homeColor = false;
                aboutColor = false;
              });
            },
            leading: Icon(Icons.shopping_cart),
            title: Text("Cart"),
          ),
          ListTile(
            selected: aboutColor,
            onTap: () {
              setState(() {
                aboutColor = true;
                contactUsColor = false;
                cartColor = false;
                homeColor = false;
              });
            },
            leading: Icon(Icons.info),
            title: Text("About"),
          ),
          ListTile(
            selected: contactUsColor,
            onTap: () {
              setState(() {
                contactUsColor = true;
                homeColor = false;
                cartColor = false;
                aboutColor = false;
              });
            },
            leading: Icon(Icons.phone),
            title: Text("Contact Us"),
          ),
          ListTile(
            onTap: () {
              FirebaseAuth.instance.signOut();
            },
            leading: Icon(Icons.exit_to_app),
            title: Text("Logout"),
          ),
        ],
      ),
    );
  }

  Widget _buildImageSlider() {
    return Container(
      height: 230,
      child: Carousel(
        showIndicator: false,
        autoplay: true,
        images: [
          AssetImage("images/hoodie.jpg"),
          AssetImage("images/watch_2.jpg"),
          AssetImage("images/Shoe.jpg"),
          AssetImage("images/Shirts.png"),
          AssetImage("images/box.jpg"),
        ],
      ),
    );
  }

  Widget _buildDressIcon() {
    List<CategoryIcon> dressIcon = categoryProvider.getDressIconData;
    List<Product> dress = categoryProvider.getDressList;
    return Row(
        children: dressIcon.map((e) {
      return GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) => ListProduct(
                name: "Dress",
                snapShot: dress,
              ),
            ),
          );
        },
        child: _buildCategoryProduct(e.image, 0xff33dcfd),
      );
    }).toList());
  }

  Widget _buildShirtIcon() {
    List<Product> shirt = categoryProvider.getShirtList;
    List<CategoryIcon> shirtIcon = categoryProvider.getShirtIconData;
    return Row(
        children: shirtIcon.map((e) {
      return GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) => ListProduct(
                name: "Shirts",
                snapShot: shirt,
              ),
            ),
          );
        },
        child: _buildCategoryProduct(e.image, 0xfff38cdd),
      );
    }).toList());
  }

  Widget _buildShoeIcon() {
    List<Product> shoes = categoryProvider.getShoesList;
    List<CategoryIcon> shoeIcon = categoryProvider.getShoeIcon;
    return Row(
        children: shoeIcon.map((e) {
      return GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) => ListProduct(
                name: "Shoes",
                snapShot: shoes,
              ),
            ),
          );
        },
        child: _buildCategoryProduct(e.image, 0xff4ff2af),
      );
    }).toList());
  }

  Widget _buildTieIcon() {
    List<Product> tie = categoryProvider.getTieList;
    List<CategoryIcon> tieIcon = categoryProvider.getTieIcon;
    return Row(
        children: tieIcon.map((e) {
      return GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) => ListProduct(
                name: "Tie",
                snapShot: tie,
              ),
            ),
          );
        },
        child: _buildCategoryProduct(e.image, 0xff74acf7),
      );
    }).toList());
  }

  Widget _buildPantIcon() {
    List<Product> pant = categoryProvider.getPantList;
    List<CategoryIcon> pantIcon = categoryProvider.getPantIcon;
    return Row(
        children: pantIcon.map((e) {
      return GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) => ListProduct(
                name: "Pant",
                snapShot: pant,
              ),
            ),
          );
        },
        child: _buildCategoryProduct(e.image, 0xffc6c8d),
      );
    }).toList());
  }

  Widget _buildCategory() {
    return Column(
      children: [
        Container(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Categtories",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  )),
            ],
          ),
        ),
        Container(
          height: 60,
          child: Row(
            children: [
              _buildDressIcon(),
              _buildShirtIcon(),
              _buildShoeIcon(),
              _buildPantIcon(),
              _buildTieIcon(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFeature() {
    List<Product> featureProduct;
    List<Product> homeFeatureProduct;

    homeFeatureProduct = productProvider.homeFeature;

    featureProduct = productProvider.getFeatureList;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Featured",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (ctx) => ListProduct(
                      name: "Featured",
                      snapShot: featureProduct,
                    ),
                  ),
                );
              },
              child: Text(
                "View more",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        Row(
            children: homeFeatureProduct.map((e) {
          return Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (ctx) => DetailScreen(
                              image: e.image, price: e.price, name: e.name),
                        ),
                      );
                    },
                    child: SingleProduct(
                      image: e.image,
                      price: e.price,
                      name: e.name,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (ctx) => DetailScreen(
                          image: e.image, price: e.price, name: e.name),
                    ));
                  },
                  child: SingleProduct(
                      image: e.image, price: e.price, name: e.name),
                ),
              ],
            ),
          );
        }).toList()),
      ],
    );
  }

  Widget _buildNewAchives() {
    List<Product> archivesProduct;
    List<Product> newAchivesProduct;

    newAchivesProduct = productProvider.getHomeAchiveList;

    archivesProduct = productProvider.newAchives;
    // List<Product> newAchivesProduct = productProvider.getHomeAchiveData();
    return Column(
      children: [
        Container(
          height: 50,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "New Archives",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (ctx) => ListProduct(
                            name: "New Archives",
                            snapShot: newAchivesProduct,
                          ),
                        ),
                      );
                    },
                    child: Text(
                      "View more",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Row(
            children: archivesProduct.map((e) {
          return Row(
            children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                      builder: (ctx) => DetailScreen(
                          image: e.image,
                          price: e.price,
                          name: e.name)));
            },
            child: SingleProduct(
                image: e.image, price: e.price, name: e.name),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                      builder: (ctx) => DetailScreen(
                          image: e.image,
                          price: e.price,
                          name: e.name)));
            },
            child: SingleProduct(
                image: e.image, price: e.price, name: e.name),
          ),
            ],
          );
        }).toList()),
      ],
    );
  }

  GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    categoryProvider = Provider.of<CategoryProvider>(context);
    categoryProvider.getShirtData();
    categoryProvider.getDressData();
    categoryProvider.getShoesData();
    categoryProvider.getPantData();
    categoryProvider.getTieData();
    // categoryProvider.getDressIconData;

    productProvider = Provider.of<ProductProvider>(context);
    productProvider.getNewAchiveData();
    productProvider.getFeatureData();
    productProvider.getHomeFeatureData();
    productProvider.getHomeAchiveData();
    categoryProvider.getShirtIcon();
    categoryProvider.getshoesIconData();
    categoryProvider.getpantIconData();
    categoryProvider.getTieIconData();
    return Scaffold(
      key: _key,
      drawer: _buildMyDrawer(),
      appBar: AppBar(
        title: Text(
          "HomePage",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.grey[100],
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.black,
          ),
          onPressed: () {
            _key.currentState.openDrawer();
          },
        ),
        actions: [
          IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.black,
              ),
              onPressed: () {}),
          NotificationButton(),
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildImageSlider(),
                  _buildCategory(),
                  SizedBox(
                    height: 20,
                  ),
                  _buildFeature(),
                  _buildNewAchives()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
