import 'package:ecommerce_grocery/Provider/grocery_provider.dart';
import 'package:ecommerce_grocery/ui/viewPage/Grocery_store_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class GroceryStorelist extends StatefulWidget {
  @override
  _GroceryStorelistState createState() => _GroceryStorelistState();
}

class _GroceryStorelistState extends State<GroceryStorelist> {
  @override
  Widget build(BuildContext context) {
    final bloc = Groceryprovider.of(context).bloc;
    //final product = bloc.catalog[index]
    return Container(
        // padding: EdgeInsets.only(top: 25),
        decoration: BoxDecoration(
            // color: Colors.white,
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(30.0),
                bottomLeft: Radius.circular(30.0))),
        child: StaggeredGridView.countBuilder(
          crossAxisCount: 4,
          itemBuilder: (BuildContext context, int index) {
            final product = bloc.catalog[index];
            return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(PageRouteBuilder(
                      transitionDuration: const Duration(milliseconds: 900),
                      pageBuilder: (context, animation, __) {
                        return FadeTransition(
                          opacity: animation,
                          child: Grocerystoredetails(
                              product: product,
                              onProductAdded: () {
                                bloc.addProduct(product);
                              }),
                        );
                      }));
                },
                child: Card(
                    elevation: 10,
                    //clipBehavior: Clip.hardEdge,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Image.asset(
                            product.productImg,
                            height: 85,
                            width: 100,
                            fit: BoxFit.contain,
                          ),
                          Text(
                            '\$${product.price}',
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                          Text(
                            '${product.productName}',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            '${product.price}',
                            style: TextStyle(color: Colors.grey, fontSize: 20),
                          )
                        ],
                      ),
                    )));
          },
          itemCount: bloc.catalog.length,
          staggeredTileBuilder: (int index) =>
              new StaggeredTile.count(2, index.isEven ? 2 : 4),
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,
        ));
  }
}
