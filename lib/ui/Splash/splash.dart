import 'dart:async';
import 'package:flutter/material.dart';

import 'package:ecommerce_grocery/ui/Athu/login.dart';
import 'package:gradient_text/gradient_text.dart';

class splashScreen extends StatefulWidget {
  @override
  _splashScreenState createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  initState() {
    super.initState();
    Timer(
        Duration(seconds: 5),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => loginPage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GradientText(
          "Grocery!",
          gradient: LinearGradient(colors: [
            Colors.green,
            Colors.cyanAccent,
            Colors.purple,
            Colors.pink
          ]),
          style: TextStyle(fontSize: 45, fontWeight: FontWeight.normal),
        ),
      ),
    );
  }
}
