import 'package:flutter/material.dart';

class appbarWidgets extends StatelessWidget {
  final double height;

  const appbarWidgets({Key key, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(120.0),
          child: AppBar(
            toolbarHeight: 110,
            automaticallyImplyLeading: false,

            title: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 29, left: 0),
                  child: Text(
                    'Grocery!',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 0),
                  child: Text(
                    'Lets go Shopping!',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),

            leading: IconButton(
              icon: Icon(Icons.menu),
              color: Colors.white,
              onPressed: () {},
            ),
            actions: [
              IconButton(
                  icon: Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 40,
                  ),
                  onPressed: null),
              IconButton(
                  icon: Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                    size: 40,
                  ),
                  onPressed: null),
            ], // hides leading widget
          )),
    );
  }
}
