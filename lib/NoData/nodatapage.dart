import 'package:flutter/material.dart';

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
        backgroundColor: Colors.blueAccent,
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
