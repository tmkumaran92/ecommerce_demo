import 'package:flutter/material.dart';

class newAddress extends StatefulWidget {
  @override
  _newAddressState createState() => _newAddressState();
}

class _newAddressState extends State<newAddress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add new address'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              TextField(decoration: InputDecoration(labelText: 'Fullname')),
              TextField(
                  decoration: InputDecoration(labelText: 'Address Line 1')),
              TextField(
                  decoration: InputDecoration(labelText: 'Address Line 2')),
              TextField(decoration: InputDecoration(labelText: 'Zip Code')),
              TextField(decoration: InputDecoration(labelText: 'City')),
              TextField(decoration: InputDecoration(labelText: 'State')),
              TextField(decoration: InputDecoration(labelText: 'Country')),
              TextField(decoration: InputDecoration(labelText: 'Phone')),
              SizedBox(
                height: 15,
              ),
              Container(
                width: double.infinity,
                height: 50,
                child: RaisedButton(
                  child: Text('Save Address'),
                  onPressed: () {},
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
