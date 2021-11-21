import 'package:drippy/pages/create.dart';
import 'package:flutter/material.dart';
import 'package:drippy/pages/home.dart';
import 'package:drippy/pages/shop.dart';
import 'package:drippy/pages/cart.dart';

class SideDrawer extends StatefulWidget {
  const SideDrawer({
    Key? key,
    required this.active,
    required this.change,
    required this.addToCart,
    required this.cartItems,
    required this.removeFromCart,
  }) : super(key: key);
  final addToCart;
  final active;
  final change;
  final cartItems;
  final removeFromCart;

  @override
  _SideDrawerState createState() => _SideDrawerState();
}

class _SideDrawerState extends State<SideDrawer> {
  @override
  Widget build(BuildContext context) {
    print('rebuild');
    return SafeArea(
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.all(0),
          children: [
            FlatButton(
              onPressed: () {
                widget.change(0);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FirstRoute(
                              active: 0,
                              change: widget.change,
                            )));
              },
              color: widget.active == 0 ? Colors.blue : Colors.white,
              child: Text(
                'Home',
                style: TextStyle(
                    fontSize: 16,
                    color: widget.active == 0 ? Colors.white : Colors.black),
              ),
              padding: EdgeInsets.all(20),
            ),
            FlatButton(
              onPressed: () {
                widget.change(1);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SecondRoute(
                            active: 1,
                            change: widget.change,
                            addToCart: widget.addToCart)));
              },
              color: widget.active == 1 ? Colors.blue : Colors.white,
              child: Text(
                'Shop',
                style: TextStyle(
                    fontSize: 16,
                    color: widget.active == 1 ? Colors.white : Colors.black),
              ),
              padding: EdgeInsets.all(20),
            ),
            FlatButton(
              onPressed: () {
                widget.change(2);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ThirdRoute(
                            active: 2,
                            change: widget.change,
                            cartItems: widget.cartItems,
                            removeFromCart: widget.removeFromCart)));
              },
              color: widget.active == 2 ? Colors.blue : Colors.white,
              child: Text(
                'Cart',
                style: TextStyle(
                    fontSize: 16,
                    color: widget.active == 2 ? Colors.white : Colors.black),
              ),
              padding: EdgeInsets.all(20),
            ),
            FlatButton(
              onPressed: () {
                widget.change(3);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            FourthRoute(active: 3, change: widget.change)));
              },
              color: widget.active == 3 ? Colors.blue : Colors.white,
              child: Text(
                'Create',
                style: TextStyle(
                    fontSize: 16,
                    color: widget.active == 3 ? Colors.white : Colors.black),
              ),
              padding: EdgeInsets.all(20),
            ),
          ],
        ),
      ),
    );
  }
}
