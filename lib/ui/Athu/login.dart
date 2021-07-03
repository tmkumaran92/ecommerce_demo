import 'package:ecommerce_grocery/ui/Athu/signUpPage.dart';
import 'package:ecommerce_grocery/ui/viewPage/viwePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_grocery/ui/Athu/forGetpage.dart';

class loginPage extends StatefulWidget {
  @override
  _loginPageState createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
          padding: EdgeInsets.all(0),
          child: SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 150,
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Text(
                  'Welcome back!',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Text(
                  'Signin to continue.',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                ),
              ),
              SizedBox(
                height: 70,
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'User Name',
                    hintText: 'Enter Your Name',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter Password',
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(left: 15, right: 15),
                child: RaisedButton(
                  textColor: Colors.white,
                  color: Colors.black87,
                  child: Text('Sign In'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => viewPage()),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(left: 15, right: 15),
                child: InkWell(
                  child: Text(
                    'Forget Password?',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => forgetpage()),
                    );
                  },
                ),
              ),
              SizedBox(height: 40),
              Container(
                width: double.infinity,
                height: 75,
                padding: EdgeInsets.only(top: 15, bottom: 15),
                margin: EdgeInsets.only(left: 15, right: 15),
                child: RaisedButton(
                  textColor: Colors.white,
                  color: Colors.deepPurpleAccent,
                  child: Text('Create New Account'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpPage()),
                    );
                  },
                ),
              )
            ],
          ))),
    );
  }
}
