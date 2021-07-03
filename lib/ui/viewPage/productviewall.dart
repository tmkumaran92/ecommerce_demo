import 'package:ecommerce_grocery/Model/productdata.dart';
import 'package:ecommerce_grocery/Provider/grocery_provider.dart';
import 'package:ecommerce_grocery/Provider/grocery_stroe_bloc.dart';
import 'package:ecommerce_grocery/ui/Widgets/MealItem.dart';
import 'package:ecommerce_grocery/ui/Widgets/StaggeredDual.dart';
import 'package:ecommerce_grocery/ui/viewPage/grocery_store_cart.dart';
import 'package:ecommerce_grocery/ui/viewPage/productstorelist.dart';
import 'package:flutter/material.dart';

const _backgroundColor = Color(0XFFF6F5F2);

const _panelTransition = Duration(milliseconds: 500);
const _cardBarheight = 100.0;

class productViewall extends StatefulWidget {
  @override
  _productViewallState createState() => _productViewallState();
}

class _productViewallState extends State<productViewall> {
  //final bloc = GroceryStateBloc();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bloc = GroceryStateBloc();

    void _onVerticalGasture(DragUpdateDetails details) {
      print(details.primaryDelta);

      if (details.primaryDelta < -7) {
        bloc.changetoCart();
      } else if (details.primaryDelta > 12) {
        bloc.changetoNormal();
      }
    }

    double _getTopForWhitePanel(GroceryState state, Size size) {
      if (state == GroceryState.normal) {
        return _cardBarheight;
      } else if (state == GroceryState.cart) {
        return -(size.height - kToolbarHeight - _cardBarheight / 2);
      }
      return 0.0;
    }

    double _getTopForBackPanel(GroceryState state, Size size) {
      if (state == GroceryState.normal) {
        return size.height - kToolbarHeight - _cardBarheight;
      } else if (state == GroceryState.cart) {
        return _cardBarheight / 2;
      }
      return 0.0;
    }

    /* return Scaffold(
      appBar: AppBar(
        title: Text(
          "Apple Thiuvizhal",
          style: TextStyle(color: Colors.white),
        ),
      ),
      /*body: Container(
        color: Colors.white,
        /*child: GridView.count(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          padding: EdgeInsets.only(top: 8, left: 6, right: 6, bottom: 12),
          children: List.generate(cards.length, (index) {
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
                            image: NetworkImage(
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
        ),*/
        /*child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: StaggeredDual(
            aspectRatio: 0.65,
            spacing: 20,
            itemCount: cards.length,
            itemBuilder: (context, index) {
              return MealItem(meal: cards[index]);
            },
          ),
        ),*/
      ),*/
      body: ListView.builder(
          padding: EdgeInsets.only(top: _cartBarheight),
          itemCount: bloc.catalog.length,
          itemBuilder: (context, index) {
            return Container(
              height: 100,
              width: 100,
              color: Colors.primaries[index % Colors.primaries.length],
            );
          }),
    );*/

    return Groceryprovider(
        bloc: bloc,
        child: AnimatedBuilder(
            animation: bloc,
            builder: (context, _) {
              {
                return Scaffold(
                    //backgroundColor: Colors.black,

                    body: Column(
                  children: [
                    //,
                    Expanded(
                      child: Stack(
                        children: [
                          AnimatedPositioned(
                            duration: _panelTransition,
                            curve: Curves.decelerate,
                            left: 0,
                            right: 0,
                            top: _getTopForWhitePanel(bloc.groceryState, size),
                            height: size.height - kToolbarHeight,
                            child: ClipRect(
                              //
                              child: GroceryStorelist(),
                            ),
                          ),
                          AnimatedPositioned(
                              duration: _panelTransition,
                              curve: Curves.decelerate,
                              left: 0,
                              right: 0,
                              top: _getTopForBackPanel(bloc.groceryState, size),
                              height: size.height - kToolbarHeight,
                              child: GestureDetector(
                                onVerticalDragUpdate: _onVerticalGasture,
                                child: Container(
                                  color: Colors.black,
                                  child: Column(
                                    children: [
                                      Padding(
                                          padding: EdgeInsets.all(25.0),
                                          child: AnimatedSwitcher(
                                            duration: _panelTransition,
                                            child: bloc.groceryState ==
                                                    GroceryState.normal
                                                ? Row(
                                                    children: [
                                                      Text(
                                                        'Cart',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      Expanded(
                                                          child:
                                                              SingleChildScrollView(
                                                                  scrollDirection:
                                                                      Axis.horizontal,
                                                                  child: Row(
                                                                    children: List
                                                                        .generate(
                                                                      bloc.cart
                                                                          .length,
                                                                      (index) => Padding(
                                                                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                                                                          child: Stack(
                                                                            children: [
                                                                              Hero(
                                                                                  tag: 'list_${bloc.cart[index].product.productName}details',
                                                                                  child: CircleAvatar(
                                                                                    backgroundColor: Colors.white,
                                                                                    backgroundImage: AssetImage(bloc.cart[index].product.productImg),
                                                                                  )),
                                                                              Positioned(
                                                                                  right: 0,
                                                                                  child: CircleAvatar(
                                                                                    radius: 10,
                                                                                    backgroundColor: Colors.red,
                                                                                    child: Text(
                                                                                      bloc.cart[index].quantity.toString(),
                                                                                      style: TextStyle(color: Colors.white),
                                                                                    ),
                                                                                  ))
                                                                            ],
                                                                          )),
                                                                    ),
                                                                  ))),
                                                      CircleAvatar(
                                                        backgroundColor:
                                                            Colors.yellow,
                                                        child: Text(bloc
                                                            .totalCartElements()
                                                            .toString()),
                                                      )
                                                    ],
                                                  )
                                                : const SizedBox.shrink(),
                                          )),
                                      Expanded(child: groceryStoreCart()),
                                    ],
                                  ),
                                ),
                              )),
                        ],
                      ),
                    )
                  ],
                ));
              }
            }));
  }
}
