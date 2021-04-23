
// import 'package:ecommerce_app/provider/category_provider.dart';
// import 'package:ecommerce_app/provider/product_provider.dart';
// import 'package:ecommerce_app/screens/homepage.dart';
// import 'package:ecommerce_app/screens/login.dart';
import 'package:ecommerce_app/screens/profilescreen.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
// import 'package:provider/provider.dart';

void main() async {
   WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();
   runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ecommerce App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      // home: MultiProvider(
      //   providers: [
      //     ListenableProvider<ProductProvider>(
      //       create: (ctx) => ProductProvider(),
      //       ),
      //     ListenableProvider<CategoryProvider>(
      //       create: (ctx) => CategoryProvider(),
      //       ),
      //   ],
      //   child: StreamBuilder(
      //       stream: FirebaseAuth.instance.authStateChanges(),
      //       builder: (ctx, snapShot) {
      //         if (snapShot.hasData) {
      //           return HomePage();
      //         } else {
      //           return Login();
      //         }
      //       }),
      // ),
      home: ProfileScreen(),
    );
  }
}
