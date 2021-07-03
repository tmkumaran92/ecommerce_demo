import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_grocery/ui/Athu/otpPage.dart';

class forgetpage extends StatefulWidget {
  @override
  _forgetpageState createState() => _forgetpageState();
}

class _forgetpageState extends State<forgetpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 200),
            Container(
              margin: EdgeInsets.only(left: 15),
              child: Text(
                'Forget Password',
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.w800),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
                margin: EdgeInsets.only(left: 15, right: 15),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Forget Password',
                    hintText: 'Enter user name',
                  ),
                )),
            SizedBox(
              height: 40,
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(right: 10, left: 10),
              decoration: new BoxDecoration(
                gradient: new LinearGradient(
                  colors: [Colors.deepPurple, Colors.blue],
                  begin: FractionalOffset.centerLeft,
                  end: FractionalOffset.centerRight,
                ),
              ),
              child: FlatButton(
                child: new Text(
                  'Send',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => otpPage()),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
