import 'package:ecommerce_grocery/Model/productdata.dart';
import 'package:flutter/material.dart';

class Grocerystoredetails extends StatefulWidget {
  const Grocerystoredetails({Key key, this.product, this.onProductAdded})
      : super(key: key);
  final CardItem product;
  final VoidCallback onProductAdded;

  @override
  _GrocerystoredetailsState createState() => _GrocerystoredetailsState();
}

class _GrocerystoredetailsState extends State<Grocerystoredetails> {
  String herotag = '';

  int _counter = 0;

  void _addToCart(BuildContext context) {
    setState(() {
      herotag = 'details';
    });
    widget.onProductAdded();
    Navigator.of(context).pop();
  }

  void _removeProduct() {
    setState(() {
      if (_counter > 0) {
        _counter--;
      }
    });
  }

  _addProduct() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Expanded(
              child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Hero(
                  tag: 'list_${widget.product.productName}$herotag',
                  child: Image.asset(
                    widget.product.productImg,
                    fit: BoxFit.cover,
                    height: MediaQuery.of(context).size.height * 0.4,
                  ),
                ),
                Text(
                  widget.product.productImg,
                  style: Theme.of(context).textTheme.headline4.copyWith(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                /* Text(widget.product.price,
                        style: Theme.of(context).textTheme.subtitle1.copyWith(
                          color: Colors.grey,
                        )),*/
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    new IconButton(
                      icon: new Icon(Icons.remove),
                      onPressed: () => _removeProduct(),
                    ),
                    new Text('$_counter'),
                    new IconButton(
                        icon: new Icon(Icons.add),
                        onPressed: () => _addProduct()),
                    Spacer(),
                    Text(
                      '\$${widget.product.price}',
                      style: Theme.of(context).textTheme.headline5.copyWith(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 1,
                ),
                Text('About the product',
                    style: Theme.of(context).textTheme.headline5.copyWith(
                          color: Colors.black,
                        )),
                SizedBox(
                  height: 6,
                ),
                Text(widget.product.description,
                    style: Theme.of(context).textTheme.subtitle1.copyWith(
                          color: Colors.black,
                        ))
              ],
            ),
          )),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: IconButton(
                      icon: Icon(
                        Icons.favorite_border,
                        color: Colors.black,
                      ),
                      onPressed: () {}),
                ),
                Expanded(
                    flex: 4,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.amber,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30))),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 15.0),
                        child: Text(
                          'Add to Cart',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      onPressed: () {
                        _addToCart(context);
                      },
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
