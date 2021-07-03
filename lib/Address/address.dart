import 'package:ecommerce_grocery/Address/newAddress.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class address extends StatefulWidget {
  @override
  _addressState createState() => _addressState();
}

class _addressState extends State<address> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Address'),
      ),
      body: Container(
        child: FutureBuilder(builder: (context, snapshot) {
          return ListView(
            //shrinkWrap: true,
            //scrollDirection: Axis.horizontal,
            //itemCount: cards.length,
            //itemBuilder: (BuildContext context, int index) {
            //return
            children: [
              Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: IconButton(
                          icon: Icon(Icons.home),
                          onPressed: () {},
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Text(
                          'Mr.karthik,\n3223 jehovah\nRoanoke,Virginia-24019,\n+14555334-34325',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    thickness: 1,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () {},
                        ),
                      ),
                      SizedBox(
                        width: 10,
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => newAddress()),
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Text(
                            'Add new adderss',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                      )
                    ],
                  ),
                  Divider(
                    thickness: 1,
                  ),
                ],
              )
            ],

            //}
          );
        }),
      ),
    );
  }
}
