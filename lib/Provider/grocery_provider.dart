import 'package:ecommerce_grocery/Provider/grocery_stroe_bloc.dart';
import 'package:flutter/material.dart';

class Groceryprovider extends InheritedWidget {
  final GroceryStateBloc bloc;
  final Widget child;
  Groceryprovider({@required this.bloc, @required this.child})
      : super(child: child);

  static Groceryprovider of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<Groceryprovider>();
  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;
}
