import 'package:flutter/material.dart';

class orderdetails extends StatefulWidget {
  @override
  _orderdetailsState createState() => _orderdetailsState();
}

class _orderdetailsState extends State<orderdetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Order Details"),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 10),
        child: Column(
          children: [
            Container(
              child: Card(
                elevation: 5,
                child: Row(
                  children: [
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 100,
                            // height: 110,
                            child: Image.network(
                                'https://picsum.photos/250?image=9'),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            child:
                                Text("qty:1", style: TextStyle(fontSize: 15)),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Text(
                              'Iphone SE- 32Gb',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ),
                          Container(
                            child: Text("Apple",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20)),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Text(
                              "460 * 1",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Container(
                            child: Text("# 460"),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  child: Text(
                    "data",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  child: Text("data", style: TextStyle(fontSize: 20)),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  child: Text("data", style: TextStyle(fontSize: 20)),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  child: Text("data", style: TextStyle(fontSize: 20)),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  child: Text("data", style: TextStyle(fontSize: 20)),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  child: Text("data", style: TextStyle(fontSize: 20)),
                ),
              ],
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Text("Payment method : Netbanking",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(bottom: 20),
              child: Text("DELIVERY ADDRESS", style: TextStyle(fontSize: 15)),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    icon: Icon(Icons.home), onPressed: () {  },
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Container(
                        child: Text(
                          "Mr.Karthick",
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      Container(
                        child:
                            Text("Mr.Karthick", style: TextStyle(fontSize: 15)),
                      ),
                      Container(
                        child:
                            Text("Mr.Karthick", style: TextStyle(fontSize: 15)),
                      ),
                      Container(
                        child:
                            Text("Mr.Karthick", style: TextStyle(fontSize: 15)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Divider(
              thickness: 1,
            ),
          ],
        ),
      ),
    );
  }
}
