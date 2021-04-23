import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/model/categoryicon.dart';
import 'package:ecommerce_app/model/product.dart';
import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';

class CategoryProvider with ChangeNotifier {
  List<Product> shirt = [];
  Product shirtData;
  List<Product> dress = [];
  Product dressData;
  List<Product> shoes = [];
  Product shoesData;
  List<Product> pant = [];
  Product pantData;
  List<Product> tie = [];
  Product tieData;
  List<CategoryIcon> dressIcon = [];
  CategoryIcon dressIconData;

  Future<void> getDressIcon() async {
    List<CategoryIcon> newList = [];
    QuerySnapshot dressSnapShot = await FirebaseFirestore.instance
        .collection("categoryicon")
        .doc("kI5uNx9APd5aOaurN1KQ")
        .collection("dress")
        .get();
    dressSnapShot.docs.forEach(
      (element) {
        dressIconData = CategoryIcon(image: element["image"]);
        newList.add(dressIconData);
      },
    );
    dressIcon = newList;
    notifyListeners();
  }

  List<CategoryIcon> get getDressIconData {
    return dressIcon;
  }

  List<CategoryIcon> shirtIcon = [];
  CategoryIcon shirtIconData;

  Future<void> getShirtIcon() async {
    List<CategoryIcon> newList = [];
    QuerySnapshot shirtSnapShot = await FirebaseFirestore.instance
        .collection("categoryicon")
        .doc("kI5uNx9APd5aOaurN1KQ")
        .collection("shirt")
        .get();
    shirtSnapShot.docs.forEach(
      (element) {
        shirtIconData = CategoryIcon(image: element["image"]);
        newList.add(shirtIconData);
      },
    );
    shirtIcon = newList;
    notifyListeners();
  }

  List<CategoryIcon> get getShirtIconData {
    return shirtIcon;
  }

  List<CategoryIcon> shoesIcon = [];
  CategoryIcon shoesIconData;

  Future<void> getshoesIconData() async {
    List<CategoryIcon> newList = [];
    QuerySnapshot shoesSnapShot = await FirebaseFirestore.instance
        .collection("categoryicon")
        .doc("kI5uNx9APd5aOaurN1KQ")
        .collection("shoe")
        .get();
    shoesSnapShot.docs.forEach(
      (element) {
        shoesIconData = CategoryIcon(image: element["image"]);
        newList.add(shoesIconData);
      },
    );
    shoesIcon = newList;
    notifyListeners();
  }

  List<CategoryIcon> get getShoeIcon {
    return shoesIcon;
  }

  List<CategoryIcon> pantIcon = [];
  CategoryIcon pantIconData;

  Future<void> getpantIconData() async {
    List<CategoryIcon> newList = [];
    QuerySnapshot pantSnapShot = await FirebaseFirestore.instance
        .collection("categoryicon")
        .doc("kI5uNx9APd5aOaurN1KQ")
        .collection("pant")
        .get();
    pantSnapShot.docs.forEach(
      (element) {
        pantIconData = CategoryIcon(image: element["image"]);
        newList.add(shoesIconData);
      },
    );
    pantIcon = newList;
    notifyListeners();
  }

  List<CategoryIcon> get getPantIcon {
    return pantIcon;
  }


  List<CategoryIcon> tieIcon = [];
  CategoryIcon tieIconData;

  Future<void> getTieIconData() async {
    List<CategoryIcon> newList = [];
    QuerySnapshot tieSnapShot = await FirebaseFirestore.instance
        .collection("categoryicon")
        .doc("kI5uNx9APd5aOaurN1KQ")
        .collection("tie")
        .get();
    tieSnapShot.docs.forEach(
      (element) {
        tieIconData = CategoryIcon(image: element["image"]);
        newList.add(tieIconData);
      },
    );
    tieIcon = newList;
    notifyListeners();
  }

  List<CategoryIcon> get getTieIcon {
    return tieIcon;
  }

  Future<void> getShirtData() async {
    List<Product> newList = [];
    QuerySnapshot shirtSnapShot = await FirebaseFirestore.instance
        .collection("category")
        .doc("2oazI5rwXtXUjS1QJKTB")
        .collection("shirt")
        .get();
    shirtSnapShot.docs.forEach(
      (element) {
        shirtData = Product(
            name: element.data()["name"],
            image: element.data()["image"],
            price: element.data()["price"]);
        newList.add(shirtData);
      },
    );
    shirt = newList;
    notifyListeners();
  }

  List<Product> get getShirtList {
    return shirt;
  }

  Future<void> getDressData() async {
    List<Product> newList = [];
    QuerySnapshot shirtSnapShot = await FirebaseFirestore.instance
        .collection("category")
        .doc("2oazI5rwXtXUjS1QJKTB")
        .collection("dress")
        .get();
    shirtSnapShot.docs.forEach(
      (element) {
        shirtData = Product(
            name: element.data()["name"],
            image: element.data()["image"],
            price: element.data()["price"]);
        newList.add(shirtData);
      },
    );
    dress = newList;
    notifyListeners();
  }

  List<Product> get getDressList {
    return dress;
  }

  Future<void> getShoesData() async {
    List<Product> newList = [];
    QuerySnapshot shirtSnapShot = await FirebaseFirestore.instance
        .collection("category")
        .doc("2oazI5rwXtXUjS1QJKTB")
        .collection("shoes")
        .get();
    shirtSnapShot.docs.forEach(
      (element) {
        shirtData = Product(
            name: element.data()["name"],
            image: element.data()["image"],
            price: element.data()["price"]);
        newList.add(shirtData);
      },
    );
    shoes = newList;
    notifyListeners();
  }

  List<Product> get getShoesList {
    return shoes;
  }

  Future<void> getPantData() async {
    List<Product> newList = [];
    QuerySnapshot shirtSnapShot = await FirebaseFirestore.instance
        .collection("category")
        .doc("2oazI5rwXtXUjS1QJKTB")
        .collection("pant")
        .get();
    shirtSnapShot.docs.forEach(
      (element) {
        shirtData = Product(
            name: element.data()["name"],
            image: element.data()["image"],
            price: element.data()["price"]);
        newList.add(shirtData);
      },
    );
    pant = newList;
    notifyListeners();
  }

  List<Product> get getPantList {
    return pant;
  }

  Future<void> getTieData() async {
    List<Product> newList = [];
    QuerySnapshot shirtSnapShot = await FirebaseFirestore.instance
        .collection("category")
        .doc("2oazI5rwXtXUjS1QJKTB")
        .collection("tie")
        .get();
    shirtSnapShot.docs.forEach(
      (element) {
        shirtData = Product(
            name: element.data()["name"],
            image: element.data()["image"],
            price: element.data()["price"]);
        newList.add(shirtData);
      },
    );
    tie = newList;
    notifyListeners();
  }

  List<Product> get getTieList {
    return tie;
  }
}
