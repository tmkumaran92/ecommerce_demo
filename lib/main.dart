import 'package:ecommerce_grocery/ui/viewPage/productPage.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_grocery/ui/Splash/splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: splashScreen(),
    );
  }
}
