import 'package:ecommerce_grocery/ui/viewPage/wishList.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:ui';
import 'dart:convert';
import 'orderdetails.dart';

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

class myorderpage extends StatefulWidget {
  @override
  _myorderpageState createState() => _myorderpageState();
}

class _myorderpageState extends State<myorderpage> {
  void initState() {
    Orderdatahistory = Wishlistlist();
    Orderdata();
  }

  @override
  Future<Orderdata> Orderdatahistory;
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("My order"),
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
                    Expanded(
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: orderlistdata == null
                                ? 0
                                : orderlistdata.data.length,
                            itemBuilder: (BuildContext context, int index) {
                              if (orderlistdata.data[index].wishlist == "yes") {
                                print(
                                    "welc1.data[1].categories ${orderlistdata.data[index].wishlist}");

                                return SingleChildScrollView(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Card(
                                      color: Colors.white,
                                      child: InkWell(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      orderdetails(),
                                                ));
                                          },
                                          child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(children: <Widget>[
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(4.0),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
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
                                                        padding:
                                                            EdgeInsets.fromLTRB(
                                                                0, 0, 20, 10),
                                                        child: Text(
                                                          orderlistdata
                                                              .data[index]
                                                              .usertype,
                                                          style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 25,
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 1,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.fromLTRB(
                                                                0, 0, 10, 0),
                                                        child: Text(
                                                          "ordered on 22/10/2020 12:55 PM",
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 15,
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.fromLTRB(
                                                                0, 0, 10, 0),
                                                        child: Text(
                                                          "Cancelled",
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 15,
                                                          ),
                                                        ),
                                                      ),
                                                    ])
                                              ]))),
                                    ));
                              } else {
                                WidgetsBinding.instance
                                    .addPostFrameCallback((_) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => nodatapage()),
                                  );
                                });
                              }
                              return Container();
                            }))
                  ],
                );
              }),
        ));
  }
}

class nodatapage extends StatefulWidget {
  @override
  _nodatapageState createState() => _nodatapageState();
}

class _nodatapageState extends State<nodatapage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('No Data'),
        backgroundColor: Colors.redAccent,
      ),
      body: Center(
        child: Text(
          " No data found",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
