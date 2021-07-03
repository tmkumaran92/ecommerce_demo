import 'package:ecommerce_grocery/NoData/nodatapage.dart';
import 'package:ecommerce_grocery/alertbox/alertbox.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:ui';
import 'dart:convert';

Wishlist wishlistFromJson(String str) => Wishlist.fromJson(json.decode(str));

String wishlistToJson(Wishlist data) => json.encode(data.toJson());

class Wishlist {
  Wishlist({
    this.message,
    this.data,
  });

  String message;
  List<Datum> data;

  factory Wishlist.fromJson(Map<String, dynamic> json) => Wishlist(
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
    this.description,
  });

  String usertype;
  String producttype;
  String img;
  String wishlist;
  String price;
  String categories;
  String description;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        usertype: json["usertype"],
        producttype: json["producttype"],
        img: json["img"],
        wishlist: json["wishlist"],
        price: json["price"],
        categories: json["categories"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "usertype": usertype,
        "producttype": producttype,
        "img": img,
        "wishlist": wishlist,
        "price": price,
        "categories": categories,
        "description": description,
      };
}

Future<Wishlist> Wishlistlist() async {
  String url = 'https://mocki.io/v1/da92b728-e499-41ac-8e63-45e0e84fe5f0';
  var response = await http.get(Uri.parse(url));

  print("${response.statusCode}");
  print("${response.body}");
  print(response);
  if (response.statusCode == 200) {
    var body1 = json.decode(response.body);
    print(body1);
    return Wishlist.fromJson(body1);
    //return response;
  }
}

class wishListData extends StatefulWidget {
  @override
  _wishListDataState createState() => _wishListDataState();
}

class _wishListDataState extends State<wishListData> {
  void initState() {
    wishlisthistory = Wishlistlist();
    Wishlist();
  }

  @override
  Future<Wishlist> wishlisthistory;
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
          future: wishlisthistory,
          builder: (context, snapshot) {
            Wishlist wishlistdata = snapshot.data;
            if (snapshot.data == null) {
              return Container();
            }
            return Column(
              children: [
                Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount:
                            wishlistdata == null ? 0 : wishlistdata.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          if (wishlistdata.data[index].wishlist == "yes") {
                            print(
                                "welc1.data[0].categories ${wishlistdata.data[index].wishlist}");
                            /* return Container(
                              margin: EdgeInsets.only(top: 10),
                              //  padding: EdgeInsets.all(10),
                              width: double.infinity,
                              child: Column(
                                children: [
                                  Container(
                                    child: Card(
                                      elevation: 5,
                                      child: Row(
                                        children: [
                                          Container(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: 100,
                                                  // height: 110,
                                                  child: Image.network(
                                                      wishlistdata
                                                          .data[index].img),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(bottom: 20),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  child: Text(
                                                    wishlistdata.data[index]
                                                        .producttype,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 20),
                                                  ),
                                                ),
                                                Container(
                                                  child: Text(
                                                      wishlistdata
                                                          .data[index].usertype,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 20)),
                                                )
                                              ],
                                            ),
                                          ),
                                          Container(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Container(
                                                  alignment: Alignment.topLeft,
                                                  child: IconButton(
                                                    icon: Icon(
                                                      Icons
                                                          .notification_important,
                                                      color: Colors.red,
                                                    ),
                                                    onPressed: () {},
                                                  ),
                                                ),
                                                Container(
                                                  child: Text("15% OFF"),
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
                                  Divider(
                                    thickness: 1,
                                  ),
                                ],
                              ),
                            );*/
                            return SingleChildScrollView(
                                padding: const EdgeInsets.all(10.0),
                                child: Card(
                                    color: Colors.white,
                                    child: InkWell(
                                        onLongPress: () {
                                          showAlertDialog(context);
                                        },
                                        child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(children: <Widget>[
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(4.0),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                  child: Image.network(
                                                    wishlistdata
                                                        .data[index].img,
                                                    width: 80,
                                                    height: 80,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              Column(
                                                //mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            20, 20, 20, 10),
                                                    child: Text(
                                                      wishlistdata
                                                          .data[index].usertype,
                                                      textAlign: TextAlign.left,
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
                                                      wishlistdata
                                                          .data[index].usertype,
                                                      textAlign: TextAlign.left,
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 15,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                width: 40,
                                              ),
                                              Container(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    Container(
                                                      child: IconButton(
                                                          icon: Icon(
                                                            Icons.favorite,
                                                            color: Colors.red,
                                                          ),
                                                          onPressed: null),
                                                    ),
                                                    Container(
                                                      child: Text(
                                                        'Rs.${wishlistdata.data[index].price}',
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 15,
                                                          //fontWeight: FontWeight.bold
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              )
                                            ])))));
                          } else {
                            WidgetsBinding.instance.addPostFrameCallback((_) {
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
    );
  }
}
