import 'package:ecommerce_grocery/Provider/grocery_provider.dart';
import 'package:flutter/material.dart';

class groceryStoreCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Groceryprovider.of(context).bloc;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Column(
              children: [
                Text(
                  'Cart',
                  style: Theme.of(context).textTheme.headline4.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: bloc.cart.length,
                    itemBuilder: (context, index) {
                      final item = bloc.cart[index];
                      return Padding(
                          padding: EdgeInsets.symmetric(vertical: 15.0),
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.white,
                                backgroundImage: AssetImage(
                                    bloc.cart[index].product.productImg),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                item.quantity.toString(),
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text('x', style: TextStyle(color: Colors.white)),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                item.product.productName,
                                style: TextStyle(color: Colors.white),
                              ),
                              Spacer(),
                              Text(
                                ('\$${(item.product.price * item.quantity).toStringAsFixed(2)}'),
                                style: TextStyle(color: Colors.white),
                              ),
                              IconButton(
                                  icon: Icon(
                                    Icons.delete,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    bloc.deleteProduct(item);
                                  })
                            ],
                          ));
                    },
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Row(
              children: [
                Text(
                  "Total",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
                Spacer(),
                Text(
                  '\$${bloc.totalpriceElements()}',
                  style: Theme.of(context).textTheme.headline4.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Colors.amber,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20))),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 15.0),
              child: Text(
                'Next',
                style: TextStyle(color: Colors.black),
              ),
            ),
            onPressed: () {
              //_addToCart(context);
            },
          )
        ],
      ),
    );
  }
}
