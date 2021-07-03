import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:otp_screen/otp_screen.dart';
import 'package:ecommerce_grocery/ui/Athu/success.dart';

class otpPage extends StatefulWidget {
  @override
  _otpPageState createState() => _otpPageState();
}

class _otpPageState extends State<otpPage> {
  Future<String> validateOtp(String otp) async {
    await Future.delayed(Duration(milliseconds: 2000));
    if (otp == "1234") {
      return null;
    } else {
      return "The entered Otp is wrong";
    }
  }

  void moveToNextScreen(context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => SuccessfulOtpScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OtpScreen.withGradientBackground(
        topColor: Colors.white,
        bottomColor: Colors.white,
        otpLength: 4,
        validateOtp: validateOtp,
        routeCallback: moveToNextScreen,
        themeColor: Colors.black87,
        titleColor: Colors.black87,
        title: "Phone Number Verification",
        subTitle: "Enter the code sent to \n +919876543210",
      ),
    );
  }
}

class SuccessfulOtpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 200,
              ),
              Container(
                margin: EdgeInsets.only(left: 13),
                child: Text(
                  'New Credentials',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.only(left: 13),
                child: Text(
                  'Your identity nas been verified!\n Set your new password',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                  margin: EdgeInsets.only(left: 15, right: 15),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'New Password',
                    ),
                  )),
              SizedBox(
                height: 20,
              ),
              Container(
                  margin: EdgeInsets.only(left: 15, right: 15),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Confirm password',
                    ),
                  )),
              SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                height: 75,
                padding: EdgeInsets.only(top: 15, bottom: 15),
                margin: EdgeInsets.only(left: 15, right: 15),
                child: RaisedButton(
                  textColor: Colors.white,
                  color: Colors.deepPurpleAccent,
                  child: Text(
                    'Update',
                    style: TextStyle(fontSize: 18),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => successpage()),
                    );
                  },
                ),
              )
            ],
          ),
        ));
  }
}
