import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/model/cartmodel.dart';
import 'package:ecommerce_app/model/product.dart';
import 'package:flutter/material.dart';

class ProductProvider with ChangeNotifier {
  List<Product> feature = [];
  Product featureData;

  List<CartModel> cartModelList = [];
  CartModel cartModel;

  void getCountData({int count}) {}

  void getCartData({String name, String image, String price, int quantity}) {
    cartModel =
        CartModel(name: name, image: image, price: price, quantity: quantity);
    cartModelList.add(cartModel);
  }

  List<CartModel> get getCartModelList {
    return List.from(cartModelList);
  }

  int get getCartModelListLength {
    return cartModelList.length;
  }

  Future<void> getFeatureData() async {
    List<Product> newList = [];
    QuerySnapshot shirtSnapShot = await FirebaseFirestore.instance
        .collection("products")
        .doc("TZnmsq2NTCXImEO9Aldt")
        .collection("featuredproduct")
        .get();
    shirtSnapShot.docs.forEach(
      (element) {
        featureData = Product(
            name: element.data()["name"],
            image: element.data()["image"],
            price: element.data()["price"]);
        newList.add(featureData);
      },
    );
    feature = newList;
  }

  List<Product> get getFeatureList {
    return feature;
  }

  List<Product> homeFeature = [];

  Future<void> getHomeFeatureData() async {
    List<Product> newList = [];
    QuerySnapshot shirtSnapShot =
        await FirebaseFirestore.instance.collection("homefeature").get();
    shirtSnapShot.docs.forEach(
      (element) {
        featureData = Product(
            name: element.data()["name"],
            image: element.data()["image"],
            price: element.data()["price"]);
        newList.add(featureData);
      },
    );
    homeFeature = newList;
    notifyListeners();
  }

  List<Product> homeAchive = [];

  Future<void> getHomeAchiveData() async {
    List<Product> newList = [];
    QuerySnapshot shirtSnapShot =
        await FirebaseFirestore.instance.collection("homeachive").get();
    shirtSnapShot.docs.forEach(
      (element) {
        featureData = Product(
            name: element.data()["name"],
            image: element.data()["image"],
            price: element.data()["price"]);
        newList.add(featureData);
      },
    );
    homeAchive = newList;
    notifyListeners();
  }

  List<Product> get getHomeAchiveList {
    return homeAchive;
  }

  List<Product> newAchives = [];
  Product newAchivesData;

  Future<void> getNewAchiveData() async {
    List<Product> newList = [];
    QuerySnapshot shirtSnapShot = await FirebaseFirestore.instance
        .collection("products")
        .doc("TZnmsq2NTCXImEO9Aldt")
        .collection("newachives")
        .get();
    shirtSnapShot.docs.forEach(
      (element) {
        newAchivesData = Product(
            name: element.data()["name"],
            image: element.data()["image"],
            price: element.data()["price"]);
        newList.add(newAchivesData);
      },
    );
    newAchives = newList;
    notifyListeners();
  }

  List<Product> get getNewAchivesList {
    return newAchives;
  }

  List<String> notificationList = [];

  void addNotification(String notification) {
    notificationList.add(notification);
  }

  int get getNotificationIndex {
    return notificationList.length;
  }
}
