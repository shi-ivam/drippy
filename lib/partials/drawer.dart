import 'package:drippy/pages/create.dart';
import 'package:flutter/material.dart';
import 'package:drippy/pages/home.dart';
import 'package:drippy/pages/shop.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({Key? key, required this.active, required this.change})
      : super(key: key);
  final active;
  final change;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.all(10),
          children: [
            FlatButton(
              onPressed: () {
                change(0);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FirstRoute(
                              active: 0,
                              change: change,
                            )));
              },
              color: active == 0 ? Colors.blue : Colors.white,
              child: Text('1'),
            ),
            FlatButton(
              onPressed: () {
                change(1);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SecondRoute(
                              active: 1,
                              change: change,
                            )));
              },
              color: active == 1 ? Colors.blue : Colors.white,
              child: Text('2'),
            ),
            FlatButton(
              onPressed: () {
                change(2);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ThirdRoute(
                              active: 2,
                              change: change,
                            )));
              },
              color: active == 2 ? Colors.blue : Colors.white,
              child: Text('3'),
            ),
          ],
        ),
      ),
    );
  }
}
