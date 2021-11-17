import 'package:flutter/material.dart';
import 'package:drippy/partials/drawer.dart';

class SecondRoute extends StatelessWidget {
  const SecondRoute({Key? key, required this.active, required this.change})
      : super(key: key);
  final active;
  final change;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Second Route'),
        ),
        body: Center(
          child: ElevatedButton(
            child: Text('Open route'),
            onPressed: () {
              // Navigate to second route when tapped.
              Navigator.of(context).pop();
            },
          ),
        ),
        drawer: SideDrawer(
          active: active,
          change: change,
        ));
  }
}
