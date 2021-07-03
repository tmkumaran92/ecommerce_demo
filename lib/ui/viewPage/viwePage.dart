import 'dart:math';

import 'package:ecommerce_grocery/ui/viewPage/accountPage.dart';
import 'package:ecommerce_grocery/ui/viewPage/cartPage.dart';
import 'package:ecommerce_grocery/ui/viewPage/productPage.dart';
import 'package:ecommerce_grocery/ui/viewPage/wishList.dart';
import 'package:ecommerce_grocery/wishlist/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_grocery/ui/Widgets/appbarWidgets.dart';
import 'package:slide_drawer/slide_drawer.dart';

import 'package:ecommerce_grocery/ui/Drawer/drawer.dart';

/*class viewPage extends StatefulWidget {
  viewPage({Key key}) : super(key: key);
  @override
  _viewPageState createState() => _viewPageState();
}

class _viewPageState extends State<viewPage> {
  int _currentIndex = 0;
  double value = 0;
  final List<Widget> _widgetOptions = [
    productPage(),
    wishListData(),
    CartProducts(),
    accoutPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120.0),
        child: AppBar(
          toolbarHeight: 110,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.deepPurpleAccent,

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
            onPressed: () {
              // SlideDrawer.of(context)?.toggle();

              app();
              print('hi');
            },
          ),
          actions: [
            IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 30,
                ),
                onPressed: null),
            IconButton(
                icon: Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                  size: 30,
                ),
                onPressed: null),
          ], // hides leading widget
        ),
      ),
      body: _widgetOptions[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        items: [
          new BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            title: Text('Wishlist'),
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            title: Text('Cart'),
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Account'),
          ),
        ],
      ),
    );

    /*Scaffold(
        body: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Colors.blue[400],
            Colors.blue[800],
          ], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
        ),
        SafeArea(
            child: Container(
          width: 200,
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              DrawerHeader(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 50.0,
                    backgroundColor: Colors.white,
                    child: Text("ka"),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "Karthick",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              )),
              Expanded(
                  child: ListView(
                children: [
                  ListTile(
                    onTap: () {},
                    leading: Icon(
                      Icons.home,
                      color: Colors.white,
                    ),
                    title: Text(
                      "Home",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  ListTile(
                    onTap: () {},
                    leading: Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                    title: Text(
                      "Person",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  ListTile(
                    onTap: () {},
                    leading: Icon(
                      Icons.settings,
                      color: Colors.white,
                    ),
                    title: Text(
                      "Setting",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  ListTile(
                    onTap: () {},
                    leading: Icon(
                      Icons.logout,
                      color: Colors.white,
                    ),
                    title: Text(
                      "Logout",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ))
            ],
          ),
        )),
        TweenAnimationBuilder(
            tween: Tween<double>(begin: 0, end: value),
            duration: Duration(milliseconds: 500),
            builder: (_, double val, __) {
              return (Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..setEntry(0, 3, 200 * val)
                  ..rotateY((pi / 6) * val),
                child:
    ,
              ));
            }),
       /* GestureDetector(
          /* onTap: () {
            setState(() {
              value == 0 ? value = 1 : value = 0;
            });
          },*/

          onHorizontalDragUpdate: (e) {
            print(e.delta.dx);
            if (e.delta.dx > 0) {
              setState(() {
                value = 1;
              });
            } else {
              setState(() {
                value = 0;
              });
            }
          },
        )*/
      ],
    ));*/
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}*/

class viewPage extends StatefulWidget {
  @override
  _viewPageState createState() => _viewPageState();
}

enum SlideDrawerExampleType {
  BASIC,
  BACKGROUND,
  GRADIENT,
  HEAD_DRAWER,
  CONTENT_DRAWER,
  HEAD_CONTENT_DRAWER,
  FULL_DRAWER,
}

class _viewPageState extends State<viewPage> {
  Key _appKey = UniqueKey();
  SlideDrawerExampleType type = SlideDrawerExampleType.BASIC;

  bool get _isBasic => type == SlideDrawerExampleType.BASIC;
  bool get _isBackground => type == SlideDrawerExampleType.BACKGROUND;
  bool get _isGradient => type == SlideDrawerExampleType.GRADIENT;
  bool get _isHead => type == SlideDrawerExampleType.HEAD_DRAWER;
  bool get _isContent => type == SlideDrawerExampleType.CONTENT_DRAWER;
  bool get _isHeadContent => type == SlideDrawerExampleType.HEAD_CONTENT_DRAWER;
  bool get _isFullDrawer => type == SlideDrawerExampleType.FULL_DRAWER;

  List<MenuItem> get _items => [
        MenuItem('All Categories',
            icon: Icons.category,
            //  onTap: () => _changeType(SlideDrawerExampleType.BASIC)
            onTap: () {}),
        MenuItem(
          'My Order',
          icon: Icons.description,
          // onTap: () => _changeType(SlideDrawerExampleType.BACKGROUND)
        ),
        MenuItem('My Cart', icon: Icons.shopping_cart_sharp, onTap: () {}
            // onTap: () => _changeType(SlideDrawerExampleType.GRADIENT)
            ),
        MenuItem('My Wishlist', icon: Icons.favorite_border, onTap: () {}
            //Tap: () => _changeType(SlideDrawerExampleType.HEAD_DRAWER)
            ),
        MenuItem('Account', icon: Icons.people, onTap: () {}
            // onTap: () => _changeType(SlideDrawerExampleType.CONTENT_DRAWER)
            ),
        MenuItem('Notification',
            icon: Icons.notification_important,
            //onTap: () => _changeType(SlideDrawerExampleType.HEAD_CONTENT_DRAWER)
            onTap: () {}),
        MenuItem('Help', icon: Icons.help, onTap: () {}
            //onTap: () => _changeType(SlideDrawerExampleType.FULL_DRAWER)
            ),
      ];

  List<MenuItem> get _itemsIcon => [
        MenuItem('All Categories',
            icon: Icons.rss_feed,
            onTap: () => _changeType(SlideDrawerExampleType.BASIC)),
        MenuItem('My Order',
            icon: Icons.favorite_border,
            onTap: () => _changeType(SlideDrawerExampleType.BACKGROUND)),
        MenuItem('My Cart',
            icon: Icons.mail_outline,
            onTap: () => _changeType(SlideDrawerExampleType.GRADIENT)),
        MenuItem('My Wishlist',
            icon: Icons.map,
            onTap: () => _changeType(SlideDrawerExampleType.HEAD_DRAWER)),
        MenuItem('Account',
            icon: Icons.person_outline,
            onTap: () => _changeType(SlideDrawerExampleType.CONTENT_DRAWER)),
        MenuItem('Notification',
            icon: Icons.alarm,
            onTap: () =>
                _changeType(SlideDrawerExampleType.HEAD_CONTENT_DRAWER)),
        MenuItem('Help',
            icon: Icons.settings,
            onTap: () => _changeType(SlideDrawerExampleType.FULL_DRAWER)),
      ];

  _changeType(type) {
    if (this.type != type)
      setState(() {
        this.type = type;
        _appKey = UniqueKey();
      });
  }

  Widget get _home {
    if (_isBasic) return _basic;
    if (_isBackground) return _background;
    if (_isGradient) return _gradient;
    if (_isHead) return _head;
    if (_isContent) return _content;
    if (_isHeadContent) return _headContent;
    if (_isFullDrawer) return _fullDrawer;
    return _basic;
  }

  Widget get _basic => SlideDrawer(
        child: HomePage(),
        items: _items,
      );

  Widget get _background => SlideDrawer(
        child: HomePage(),
        brightness: Brightness.dark,
        backgroundColor: Colors.blue[900],
        items: _items,
      );

  Widget get _gradient => SlideDrawer(
        child: HomePage(),
        brightness: Brightness.dark,
        backgroundGradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.0, 1.0],
          colors: [
            Color(0xFF000046),
            Color(0xFF1CB5E0),
          ],
        ),
        curve: Curves.easeInOut,
        items: _itemsIcon,
      );

  Widget get _head => SlideDrawer(
        child: HomePage(),
        brightness: Brightness.dark,
        backgroundColor: Colors.blue[800],
        headDrawer: Image.asset('boys.png'),
        alignment: SlideDrawerAlignment.start,
        items: _itemsIcon,
      );

  Widget get _content => SlideDrawer(
        child: HomePage(),
        brightness: Brightness.dark,
        contentDrawer: Container(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            children: [
              for (var item in _itemsIcon)
                ListTile(
                  title: Text(item.title),
                  leading: Icon(item.icon),
                  onTap: item.onTap,
                ),
            ],
          ),
        ),
        backgroundGradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.0, 1.0],
          colors: [
            Colors.blue[800],
            Color(0xFF1CB5E0),
          ],
        ),
      );

  Widget get _headContent => SlideDrawer(
        child: HomePage(),
        brightness: Brightness.light,
        backgroundColor: Color(0xffededed),
        alignment: SlideDrawerAlignment.start,
        headDrawer: Image.asset('boys.png'),
        contentDrawer: Container(
          padding: EdgeInsets.only(left: 10, top: 18),
          child: Column(
            children: [
              for (var item in _itemsIcon)
                ListTile(
                  title: Text(item.title),
                  leading: Icon(item.icon),
                  onTap: item.onTap,
                ),
            ],
          ),
        ),
      );

  Widget get _fullDrawer => SlideDrawer(
        child: HomePage(),
        isRotate: false,
        offsetFromRight: 100,
        drawer: Container(
          color: Colors.teal,
          padding: EdgeInsets.symmetric(vertical: 36, horizontal: 15),
          child: Theme(
            data: ThemeData(brightness: Brightness.dark),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                for (var item in _items)
                  ListTile(
                    title: Text(item.title),
                    onTap: item.onTap,
                  ),
              ],
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      key: _appKey,
      title: 'Slide Drawer Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: _home,
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  double value = 0;
  final List<Widget> _widgetOptions = [
    productPage(),
    wishListData(),
    CartProducts(),
    accoutPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120.0),
        child: AppBar(
          toolbarHeight: 110,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.blueAccent,

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
            onPressed: () {
              SlideDrawer.of(context)?.toggle();
            },
          ),
          actions: [
            IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 30,
                ),
                onPressed: null),
            IconButton(
                icon: Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                  size: 30,
                ),
                onPressed: null),
          ], // hides leading widget
        ),
      ),

      body: _widgetOptions[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        items: [
          new BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            title: Text('Wishlist'),
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            title: Text('Cart'),
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Account'),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
