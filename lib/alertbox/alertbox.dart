import 'package:flutter/material.dart';

showAlertDialog(BuildContext context) {
  // Create button
  Widget CancelButton = FlatButton(
    child: Text("CANCEL"),
    onPressed: () {
      // Navigator.of(context).pop();
    },
  );
  Widget okButton = FlatButton(
    child: Text("YES!"),
    onPressed: () {
      // Navigator.of(context).pop();
    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Do you want to remove this item from your whishlist?"),
    // content: Text("This is an alert message."),
    actions: [okButton, CancelButton],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
