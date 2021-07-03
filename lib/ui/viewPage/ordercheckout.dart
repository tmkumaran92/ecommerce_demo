import 'package:ecommerce_grocery/Address/newAddress.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:ui';
import 'dart:convert';

String radioItem = '';
enum BestTutorSite { javatpoint, w3schools, tutorialandexample }

Orderdata orderdataFromJson(String str) => Orderdata.fromJson(json.decode(str));

String orderdataToJson(Orderdata data) => json.encode(data.toJson());

class Orderdata {
  Orderdata({
    this.message,
    this.data,
  });

  String message;
  List<Datum> data;

  factory Orderdata.fromJson(Map<String, dynamic> json) => Orderdata(
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.usertype,
    this.producttype,
    this.img,
    this.wishlist,
    this.price,
    this.categories,
    this.order,
    this.ordedate,
    this.description,
  });

  String usertype;
  String producttype;
  String img;
  String wishlist;
  String price;
  String categories;
  String order;
  String ordedate;
  String description;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        usertype: json["usertype"],
        producttype: json["producttype"],
        img: json["img"],
        wishlist: json["wishlist"],
        price: json["price"],
        categories: json["categories"],
        order: json["order"],
        ordedate: json["ordedate"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "usertype": usertype,
        "producttype": producttype,
        "img": img,
        "wishlist": wishlist,
        "price": price,
        "categories": categories,
        "order": order,
        "ordedate": ordedate,
        "description": description,
      };
}

Future<Orderdata> Wishlistlist() async {
  String uri = 'https://mocki.io/v1/da92b728-e499-41ac-8e63-45e0e84fe5f0';
  var response = await http.get(Uri.parse(uri));

  print("${response.statusCode}");
  print("${response.body}");
  print(response);
  if (response.statusCode == 200) {
    var body1 = json.decode(response.body);
    print(body1);
    return Orderdata.fromJson(body1);
    //return response;
  }
}

class ordercheckoutpage extends StatefulWidget {
  @override
  _ordercheckoutpageState createState() => _ordercheckoutpageState();
}

class _ordercheckoutpageState extends State<ordercheckoutpage> {
  BestTutorSite _site = BestTutorSite.javatpoint;

  void initState() {
    Orderdatahistory = Wishlistlist();
    Orderdata();
  }

  @override
  Future<Orderdata> Orderdatahistory;
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Order Checkout'),
        ),
        body: Container(
            child: FutureBuilder(
                future: Orderdatahistory,
                builder: (context, snapshot) {
                  Orderdata orderlistdata = snapshot.data;
                  if (snapshot.data == null) {
                    return Container();
                  }
                  return Column(
                    children: [
                      Container(
                          child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 20, right: 0),
                            child: Text(
                              'Delivery Adderss',
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.normal),
                            ),
                          ),
                          Column(
                            //crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ListTile(
                                title: const Text(
                                    'Mr.karthick,\n3223 jehovah\nRoanoke,Virginia-24019,\n+14555334-34325'),
                                leading: Radio(
                                  value: BestTutorSite.javatpoint,
                                  groupValue: _site,
                                  onChanged: (BestTutorSite value) {
                                    setState(() {
                                      _site = value;
                                    });
                                  },
                                ),
                              ),
                              ListTile(
                                title: const Text(
                                    'Mr.Muthukumaran,\n3223 jehovah\nRoanoke,Virginia-24019,\n+14555334-34325'),
                                leading: Radio(
                                  value: BestTutorSite.tutorialandexample,
                                  groupValue: _site,
                                  onChanged: (BestTutorSite value) {
                                    setState(() {
                                      _site = value;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                          Divider(
                            thickness: 1,
                          ),
                          Row(
                            //crossAxisAlignment: CrossAxisAlignment.start,
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
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Divider(
                            thickness: 1,
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Item(s) in cart",
                              style: TextStyle(
                                  fontWeight: FontWeight.normal, fontSize: 20),
                            ),
                          ),
                        ],
                      )),
                      Expanded(
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: orderlistdata == null
                                  ? 0
                                  : orderlistdata.data.length,
                              itemBuilder: (BuildContext context, int index) {
                                if (orderlistdata.data[index].wishlist ==
                                    "yes") {
                                  print(
                                      "welc1.data[1].categories ${orderlistdata.data[index].wishlist}");

                                  return SingleChildScrollView(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Column(
                                        children: [
                                          Card(
                                            color: Colors.white,
                                            child: InkWell(
                                                onTap: () {},
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Row(children: <Widget>[
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              4.0),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                        child: Image.network(
                                                          orderlistdata
                                                              .data[index].img,
                                                          width: 80,
                                                          height: 80,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 20,
                                                    ),
                                                    Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Padding(
                                                            padding: EdgeInsets
                                                                .fromLTRB(0, 0,
                                                                    20, 10),
                                                            child: Text(
                                                              orderlistdata
                                                                  .data[index]
                                                                  .usertype,
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 25,
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 1,
                                                          ),
                                                          Padding(
                                                            padding: EdgeInsets
                                                                .fromLTRB(0, 0,
                                                                    10, 0),
                                                            child: Text(
                                                              orderlistdata
                                                                  .data[index]
                                                                  .producttype,
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 15,
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding: EdgeInsets
                                                                .fromLTRB(0, 0,
                                                                    10, 0),
                                                            child: Row(
                                                              children: [
                                                                Container(
                                                                    child: Icon(
                                                                  Icons
                                                                      .remove_circle_outline,
                                                                  size: 20,
                                                                )),
                                                                SizedBox(
                                                                  width: 5,
                                                                ),
                                                                Container(
                                                                  child:
                                                                      Text("1"),
                                                                ),
                                                                SizedBox(
                                                                  width: 5,
                                                                ),
                                                                Container(
                                                                  child: Icon(
                                                                    Icons
                                                                        .add_circle_outline,
                                                                    size: 20,
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                          )
                                                        ]),
                                                    SizedBox(
                                                      width: 40,
                                                    ),
                                                    Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        children: [
                                                          /*Padding(
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              0, 0, 20, 10),
                                                      child: IconButton(
                                                        icon: Icon(
                                                            // Icons.delete,
                                                            Icons
                                                                .delete_outline),
                                                        iconSize: 35,
                                                        //color: Colors.green,
                                                        // splashColor: Colors.purple,
                                                        onPressed: () {},
                                                      ),
                                                    ),*/
                                                          IconButton(
                                                            icon: Icon(
                                                                // Icons.delete,
                                                                Icons
                                                                    .delete_outline),
                                                            iconSize: 35,
                                                            //color: Colors.green,
                                                            // splashColor: Colors.purple,
                                                            onPressed: () {},
                                                          ),
                                                          SizedBox(
                                                            height: 1,
                                                          ),
                                                          /* Padding(
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              0, 0, 20, 0),
                                                      child: Text(
                                                        orderlistdata
                                                            .data[index]
                                                            .producttype,
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 15,
                                                        ),
                                                      ),
                                                    ),*/
                                                          Container(
                                                            child:
                                                                Text("240 * 1"),
                                                          ),
                                                          Container(
                                                              child: Row(
                                                            children: [
                                                              Container(
                                                                child: Icon(Icons
                                                                    .monetization_on),
                                                              ),
                                                              Container(
                                                                child:
                                                                    Text("240"),
                                                              ),
                                                            ],
                                                          ))
                                                        ]),
                                                  ]),
                                                )),
                                          ),
                                        ],
                                      ));
                                } else {
                                  WidgetsBinding.instance
                                      .addPostFrameCallback((_) {
                                    /*Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => nodatapage()),
                                    );*/
                                  });
                                }
                                return Container();
                              })),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text("SUBTOTAL"),
                          SizedBox(
                            width: 9,
                          ),
                          Text("#23343")
                        ],
                      ),
                      SizedBox(
                        height: 9,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text("SHIPPING CHARGE"),
                          SizedBox(
                            width: 9,
                          ),
                          Text("#45")
                        ],
                      ),
                      SizedBox(
                        height: 9,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text("GRAND TOTAL"),
                          SizedBox(
                            width: 9,
                          ),
                          Text("#23343")
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Have a Coupon Code?"),
                        ],
                      ),
                      /*   Column(
                        children: [
                          ListTile(
                            title: const Text('Cash on delivery'),
                            leading: Radio(
                              value: BestTutorSite.javatpoint,
                              groupValue: _site,
                              onChanged: (BestTutorSite value) {
                                setState(() {
                                  _site = value;
                                });
                              },
                            ),
                          ),
                          ListTile(
                            title: const Text('Netbanking'),
                            leading: Radio(
                              value: BestTutorSite.tutorialandexample,
                              groupValue: _site,
                              onChanged: (BestTutorSite value) {
                                setState(() {
                                  _site = value;
                                });
                              },
                            ),
                          ),
                          ListTile(
                            title: const Text('PayPal'),
                            leading: Radio(
                              value: BestTutorSite.tutorialandexample,
                              groupValue: _site,
                              onChanged: (BestTutorSite value) {
                                setState(() {
                                  _site = value;
                                });
                              },
                            ),
                          ),
                        ],
                      ),*/
                      Divider(),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Subtotal",
                                    style:
                                        Theme.of(context).textTheme.subtitle),
                                Text("Rs. 899.01",
                                    style:
                                        Theme.of(context).textTheme.headline),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(right: 10),
                              height: 50,
                              child: RaisedButton(
                                child: Text(
                                  "Place Order",
                                  style: Theme.of(context)
                                      .textTheme
                                      .button
                                      .copyWith(
                                        color: Colors.white,
                                      ),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            ordercheckoutpage(),
                                      ));
                                },
                                color: Colors.deepPurple,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(3.0),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      Divider(),
                    ],
                  );
                })));
  }
}
