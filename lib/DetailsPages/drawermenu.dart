import 'package:flutter/material.dart';

class menubar extends StatefulWidget {
  @override
  _menubarState createState() => _menubarState();
}

class _menubarState extends State<menubar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //lets start first bycreatting the background color
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.blue[400], Colors.blue[800]],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter)),
          ),
          SafeArea(
              child: Container(
            width: 200,
            padding: EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [CircleAvatar()],
            ),
          ))
        ],
      ),
    );
  }
}
