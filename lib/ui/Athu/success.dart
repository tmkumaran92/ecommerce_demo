import 'package:flutter/material.dart';
import 'package:animated_icon_button/animated_icon_button.dart';

import 'login.dart';

class successpage extends StatefulWidget {
  @override
  _successpageState createState() => _successpageState();
}

class _successpageState extends State<successpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 170,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  // AnimatedIconButton
                  AnimatedIconButton(
                    size: 35,
                    onPressed: () {
                      print("button with background color pressed");
                    },
                    duration: Duration(milliseconds: 400),
                    endIcon: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    startIcon: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    startBackgroundColor: Colors.red,
                    endBackgroundColor: Colors.red,
                  ),

                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    child: Text(
                      'Passwoed Updated!',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    child: Text(
                      'Your passwoed has been updated!',
                      style:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                    ),
                  ),

                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    //width: double.infinity,
                    width: 350,
                    height: 50,
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.deepPurpleAccent,
                      child: Text('Login'),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => loginPage()),
                        );
                      },
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
