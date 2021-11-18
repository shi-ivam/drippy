import 'package:drippy/pages/cart.dart';
import 'package:flutter/material.dart';
import 'package:drippy/partials/drawer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Drippy',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Drippy'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _number = 0;
  var cartItems = [];

  void _setInt(x) {
    setState(() {
      _number = x;
    });
  }

  void _addToCart(e) {
    setState(() {
      cartItems = cartItems + [e];
    });
  }

  void _removeFromCart(e) {
    setState(() {
      cartItems = cartItems
          .where(
              (element) => (element["key"].toString() != e["key"].toString()))
          .toList();
      // print(cartItems);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[Text('Nice')],
          ),
        ),
        drawer: SideDrawer(
          active: _number,
          change: _setInt,
          addToCart: _addToCart,
          removeFromCart: _removeFromCart,
          cartItems: cartItems,
        ));
  }
}
