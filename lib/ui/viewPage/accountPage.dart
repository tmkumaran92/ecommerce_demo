import 'package:ecommerce_grocery/Address/address.dart';
import 'package:ecommerce_grocery/DetailsPages/order.dart';
import 'package:flutter/material.dart';

class accoutPage extends StatefulWidget {
  @override
  _accoutPageState createState() => _accoutPageState();
}

class _accoutPageState extends State<accoutPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(top: 20, bottom: 10),
          child: CircleAvatar(
            child: Text(
              "k",
              style: TextStyle(fontSize: 20),
            ),
            maxRadius: 40,
            backgroundColor: Colors.red,
          ),
        ),
        Column(
          children: [
            Text(
              'Karthik',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Text('9874561230',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text('Karthik@gmail.com',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 50, bottom: 0),
              child: IconButton(
                icon: Icon(
                  //Icons.filter_none_outlined,
                  Icons.ac_unit,

                  size: 20,
                ),
              ),
            ),
            SizedBox(
              width: 50,
            ),
            Container(
              margin: EdgeInsets.only(top: 50, bottom: 0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => myorderpage(),
                      ));
                },
                child: Text(
                  'My Orders',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                ),
              ),
            ),
          ],
        ),
        const Divider(
          height: 10,
          thickness: 1,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 0),
              child: IconButton(
                icon: Icon(
                  Icons.home,
                  size: 20,
                ),
              ),
            ),
            SizedBox(
              width: 50,
            ),
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => address(),
                      ));
                },
                child: Text(
                  'My Address',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                ),
              ),
            ),
          ],
        ),
        const Divider(
          height: 10,
          thickness: 1,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 0),
              child: IconButton(
                icon: Icon(
                  Icons.notification_important,
                  size: 20,
                ),
              ),
            ),
            SizedBox(
              width: 50,
            ),
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 0),
              child: InkWell(
                onTap: () {},
                child: Text(
                  'Notification',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                ),
              ),
            ),
          ],
        ),
        const Divider(
          height: 10,
          thickness: 1,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 0),
              child: IconButton(
                icon: Icon(
                  Icons.settings,
                  size: 20,
                ),
              ),
            ),
            SizedBox(
              width: 50,
            ),
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 0),
              child: InkWell(
                onTap: () {},
                child: Text(
                  'Account Setting'
                  '',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                ),
              ),
            ),
          ],
        ),
        const Divider(
          height: 10,
          thickness: 1,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 0),
              child: IconButton(
                icon: Icon(
                  Icons.help,
                  size: 20,
                ),
              ),
            ),
            SizedBox(
              width: 50,
            ),
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 0),
              child: InkWell(
                onTap: () {},
                child: Text(
                  'Help',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                ),
              ),
            ),
          ],
        ),
        const Divider(
          height: 10,
          thickness: 1,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 0),
              child: IconButton(
                icon: Icon(
                  Icons.language,
                  size: 20,
                ),
              ),
            ),
            SizedBox(
              width: 50,
            ),
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 0),
              child: InkWell(
                onTap: () {},
                child: Text(
                  'App Language',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                ),
              ),
            ),
          ],
        ),
        const Divider(
          height: 10,
          thickness: 1,
        ),
      ],
    ));
  }
}
