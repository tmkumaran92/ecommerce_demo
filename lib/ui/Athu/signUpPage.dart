import 'package:ecommerce_grocery/ui/viewPage/viwePage.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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
                height: 100,
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Text(
                  'Welcome!',
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
                  'Create a new account.',
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
                    labelText: 'Email',
                    hintText: 'Enter Email',
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
                height: 45,
                margin: EdgeInsets.only(left: 15, right: 15, top: 10),
                child: RaisedButton(
                  textColor: Colors.white,
                  color: Colors.deepPurpleAccent,
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
                margin: EdgeInsets.only(left: 30, top: 20),
                child: Text('Or Continue With'),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 160,
                    height: 45,
                    margin: EdgeInsets.only(left: 50, right: 0, top: 10),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.red,
                      child: Text('FaceBook'),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => viewPage()),
                        );
                      },
                    ),
                  ),
                  Container(
                    width: 160,
                    height: 45,
                    margin: EdgeInsets.only(top: 10),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.blueAccent,
                      child: Text('Gmail'),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => viewPage()),
                        );
                      },
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 5,
              ),
            ],
          ))),
    );
  }
}
