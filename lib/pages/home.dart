import 'package:flutter/material.dart';
import 'package:drippy/partials/drawer.dart';

class FirstRoute extends StatelessWidget {
  const FirstRoute({Key? key, required this.active, required this.change})
      : super(key: key);
  final active;
  final change;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Back'),
          onPressed: () {
            // Navigate to second route when tapped.
            Navigator.of(context).pop();
          },
        ),
      ),
      // drawer: SideDrawer(
      //   active: active,
      //   change: change,
      // )
    );
    // ;
  }
}
