import 'package:ecommerce_grocery/Model/productdata.dart';

import 'package:ecommerce_grocery/ui/viewPage/productViewpage.dart';
import 'package:ecommerce_grocery/ui/viewPage/productviewall.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class productPage extends StatefulWidget {
  final List<CardItem> tasks;
  productPage({Key key, @required this.tasks}) : super(key: key);
  @override
  _productPageState createState() => _productPageState();
}

class _productPageState extends State<productPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(),
        body: SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(),
        child: Column(
          children: <Widget>[
            Container(
                // height: 200,
                width: double.infinity,
                margin: EdgeInsets.only(
                  top: 13,
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TopCategories(),
                      Scorlledview(),
                      Applethiruvizha(),
                      newArrivals(),
                      miniscrolledview(),
                      featureproduct(),
                      offeredProduct()
                    ])),
          ],
        ),
      ),
    ));
  }

  Widget TopCategories() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 0.0, left: 4.0, right: 0.0),
          child: Text(
            "TopCategories",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        Container(
          height: 130,
          margin: EdgeInsets.only(top: 13, bottom: 0),
          child: FutureBuilder(builder: (context, snapshot) {
            return ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: cards.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    child: Column(
                      children: [
                        Flexible(
                            child: ClipRRect(
                                child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            border: Border(
                                left: new BorderSide(color: Colors.green),
                                top: new BorderSide(color: Colors.green),
                                bottom: new BorderSide(color: Colors.green),
                                right: new BorderSide(color: Colors.green)),
                          ),
                          child: Image.asset(
                            cards[index].productImg,
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                        ))),
                        Container(
                          width: 100,
                          padding: EdgeInsets.all(10),
                          child: Text(cards[index].productName,
                              style: new TextStyle(fontSize: 12),
                              softWrap: true),
                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => productViewall(),
                          ));
                    },
                  );
                });
          }),
        ),
      ],
    );
  }

  Widget Scorlledview() {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 8.0,
      ),
      height: 230.0,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          //itemCount: cards.length,
          itemCount: 4,
          itemBuilder: (BuildContext context, int index) => InkWell(
                child: Column(
                  children: [
                    Container(
                      width: 350,
                      height: 200,
                      margin:
                          EdgeInsets.only(top: 0, left: 6, right: 6, bottom: 0),
                      decoration: BoxDecoration(
                        color: Colors.lightBlueAccent,
                        border: Border.all(
                          color: Colors.white,
                          //width: 5,
                        ),
                        gradient: LinearGradient(
                          colors: [Colors.white, Colors.black26],
                        ),
                        image: DecorationImage(
                          image: AssetImage('${cards[index].productImg}'),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                  ],
                ),
                onTap: () {},
              )),
    );
  }

  Widget Applethiruvizha() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 0.0, left: 8.0, right: 8.0),
              child: Text('Apple Thiruvizha!',
                  style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w700)),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0, top: 0.0, left: 8.0),
              child: RaisedButton(
                  color: Theme.of(context).primaryColor,
                  child:
                      Text('View All', style: TextStyle(color: Colors.white)),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => productViewall(),
                        ));
                  }),
            )
          ],
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 8.0),
          height: 200.0,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: cards.length,
            itemBuilder: (BuildContext context, int index) => Card(
              child: InkWell(
                child: Column(
                  children: [
                    Flexible(
                      child: Container(
                        height: double.infinity,
                        width: 120,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          image: AssetImage(
                            cards[index].productImg,
                          ),
                          fit: BoxFit.fitHeight,
                        )),
                      ),
                    ),
                    Container(
                      width: 150,
                      padding: EdgeInsets.all(10),
                      child: Text(cards[index].productName,
                          style: new TextStyle(fontSize: 12), softWrap: true),
                    ),
                  ],
                ),
                onTap: () {
                  // print("hi");
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            productviewpage(task: cards[index])),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget newArrivals() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 0.0, left: 8.0, right: 8.0),
              child: Text('New Arrivals!',
                  style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w700)),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0, top: 0.0, left: 8.0),
              child: RaisedButton(
                  color: Theme.of(context).primaryColor,
                  child:
                      Text('View All', style: TextStyle(color: Colors.white)),
                  onPressed: () {
                    //Navigator.pushNamed(context, '/categorise');
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => productViewall(),
                        ));
                  }),
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 8.0),
          height: 260.0,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: cards.length,
            itemBuilder: (BuildContext context, int index) => Card(
              child: InkWell(
                child: Column(
                  children: [
                    Flexible(
                      child: Container(
                        height: double.infinity,
                        width: 200,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          image: AssetImage(
                            cards[index].productImg,
                          ),
                          fit: BoxFit.fitHeight,
                        )),
                      ),
                    ),
                    Container(
                      width: 150,
                      padding: EdgeInsets.all(10),
                      child: Text(cards[index].productName,
                          style: new TextStyle(fontSize: 12), softWrap: true),
                    ),
                  ],
                ),
                onTap: () {},
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget miniscrolledview() {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 8.0,
      ),
      height: 150.0,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          //itemCount: cards.length,
          itemCount: 4,
          itemBuilder: (BuildContext context, int index) => InkWell(
                child: Column(
                  children: [
                    Container(
                      width: 250,
                      height: 150,
                      margin:
                          EdgeInsets.only(top: 0, left: 6, right: 6, bottom: 0),
                      decoration: BoxDecoration(
                        color: Colors.lightBlueAccent,
                        border: Border.all(
                          color: Colors.white,
                          //width: 5,
                        ),
                        gradient: LinearGradient(
                          colors: [Colors.white, Colors.black26],
                        ),
                        image: DecorationImage(
                          image: AssetImage('${cards[index].productImg}'),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                  ],
                ),
                onTap: () {},
              )),
    );
  }

  Widget offeredProduct() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 10.0, left: 8.0, right: 8.0),
              child: Text('Great Antumn Sale!',
                  style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w700)),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0, top: 10.0, left: 8.0),
              child: RaisedButton(
                  color: Theme.of(context).primaryColor,
                  child:
                      Text('View All', style: TextStyle(color: Colors.white)),
                  onPressed: () {
                    // Navigator.pushNamed(context, '/categorise');
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => productViewall(),
                        ));
                  }),
            )
          ],
        ),
        Container(
          child: GridView.count(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            padding: EdgeInsets.only(top: 8, left: 6, right: 6, bottom: 12),
            children: List.generate(/*cards.length*/ 5, (index) {
              return Container(
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: () {
                      print('Card tapped.');
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Flexible(
                          child: Container(
                            height: double.infinity,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                              image: AssetImage(
                                cards[index].productImg,
                              ),
                              fit: BoxFit.fitHeight,
                            )),
                          ),
                        ),
                        ListTile(
                            title: Text(
                          cards[index].productName,
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 12),
                        )),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }

  Widget featureproduct() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 10.0, left: 8.0, right: 8.0),
              child: Text('Featured Products',
                  style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w700)),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0, top: 10.0, left: 8.0),
              child: RaisedButton(
                  color: Theme.of(context).primaryColor,
                  child:
                      Text('View All', style: TextStyle(color: Colors.white)),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => productViewall(),
                        ));
                  }),
            )
          ],
        ),
        Container(
          child: GridView.count(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            padding: EdgeInsets.only(top: 8, left: 6, right: 6, bottom: 12),
            children: List.generate(/*cards.length*/ 5, (index) {
              return Container(
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: () {
                      print('Card tapped.');
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Flexible(
                          child: Container(
                            height: double.infinity,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                              image: AssetImage(
                                cards[index].productImg,
                              ),
                              fit: BoxFit.fitHeight,
                            )),
                          ),
                        ),
                        ListTile(
                            title: Text(
                          cards[index].productName,
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 12),
                        )),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
