import 'package:ecommerce_grocery/ui/viewPage/viwePage.dart';
import 'package:flutter/material.dart';
import 'package:slide_drawer/slide_drawer.dart';

enum SlideDrawerExampleType {
  BASIC,
  BACKGROUND,
  GRADIENT,
  HEAD_DRAWER,
  CONTENT_DRAWER,
  HEAD_CONTENT_DRAWER,
  FULL_DRAWER,
}

class app extends StatefulWidget {
  @override
  _appState createState() => _appState();
}

class _appState extends State<app> {
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
        MenuItem('Basic',
            onTap: () => _changeType(SlideDrawerExampleType.BASIC)),
        MenuItem('Custom Background',
            onTap: () => _changeType(SlideDrawerExampleType.BACKGROUND)),
        MenuItem('Custom Gradient',
            onTap: () => _changeType(SlideDrawerExampleType.GRADIENT)),
        MenuItem('Custom Header',
            onTap: () => _changeType(SlideDrawerExampleType.HEAD_DRAWER)),
        MenuItem('Custom Content',
            onTap: () => _changeType(SlideDrawerExampleType.CONTENT_DRAWER)),
        MenuItem('Header and Content',
            onTap: () =>
                _changeType(SlideDrawerExampleType.HEAD_CONTENT_DRAWER)),
        MenuItem('Full Drawer',
            onTap: () => _changeType(SlideDrawerExampleType.FULL_DRAWER)),
      ];

  List<MenuItem> get _itemsIcon => [
        MenuItem('Basic',
            icon: Icons.rss_feed,
            onTap: () => _changeType(SlideDrawerExampleType.BASIC)),
        MenuItem('Custom Background',
            icon: Icons.favorite_border,
            onTap: () => _changeType(SlideDrawerExampleType.BACKGROUND)),
        MenuItem('Custom Gradient',
            icon: Icons.mail_outline,
            onTap: () => _changeType(SlideDrawerExampleType.GRADIENT)),
        MenuItem('Custom Header',
            icon: Icons.map,
            onTap: () => _changeType(SlideDrawerExampleType.HEAD_DRAWER)),
        MenuItem('Custom Content',
            icon: Icons.person_outline,
            onTap: () => _changeType(SlideDrawerExampleType.CONTENT_DRAWER)),
        MenuItem('Header and Content',
            icon: Icons.alarm,
            onTap: () =>
                _changeType(SlideDrawerExampleType.HEAD_CONTENT_DRAWER)),
        MenuItem('Full Drawer',
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
        child: viewPage(),
        items: _items,
      );

  Widget get _background => SlideDrawer(
        child: viewPage(),
        brightness: Brightness.dark,
        backgroundColor: Colors.blue[900],
        items: _items,
      );

  Widget get _gradient => SlideDrawer(
        child: viewPage(),
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
        child: viewPage(),
        brightness: Brightness.dark,
        backgroundColor: Colors.blue[800],
        headDrawer: Image.asset('boys.png'),
        alignment: SlideDrawerAlignment.start,
        items: _itemsIcon,
      );

  Widget get _content => SlideDrawer(
        child: viewPage(),
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
        child: viewPage(),
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
        child: viewPage(),
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
    return Container();
  }
}
