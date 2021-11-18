import 'package:flutter/material.dart';
import 'package:drippy/partials/drawer.dart';

class SecondRoute extends StatefulWidget {
  const SecondRoute({Key? key, required this.active, required this.change})
      : super(key: key);
  final active;
  final change;

  @override
  _SecondRouteState createState() => _SecondRouteState();
}

class _SecondRouteState extends State<SecondRoute> {
  var items = [
    {
      "title": "Shoes",
      "price": 24.99,
    },
    {
      "title": "Shirt",
      "price": 29.99,
    },
    {
      "title": "Belt",
      "price": 10.99,
    },
    {
      "title": "Beslt",
      "price": 12.99,
    },
    {
      "title": "Shoes",
      "price": 24.99,
    },
    {
      "title": "Shirt",
      "price": 29.99,
    },
    {
      "title": "Belt",
      "price": 10.99,
    },
    {
      "title": "Beslt",
      "price": 12.99,
    },
    {
      "title": "Shoes",
      "price": 24.99,
    },
    {
      "title": "Shirt",
      "price": 29.99,
    },
    {
      "title": "Belt",
      "price": 10.99,
    },
    {
      "title": "Beslt",
      "price": 12.99,
    },
    {
      "title": "Shoes",
      "price": 24.99,
    },
    {
      "title": "Shirt",
      "price": 29.99,
    },
    {
      "title": "Belt",
      "price": 10.99,
    },
    {
      "title": "Beslt",
      "price": 12.99,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Second Route'),
        ),
        body: ListView(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
          children: [
            ...items.map((e) => Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        offset: const Offset(
                          0.0,
                          5.0,
                        ),
                        blurRadius: 10.0,
                        spreadRadius: 5.0,
                      ),
                    ],
                  ),
                  margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 4,
                        child: Column(
                          children: [
                            Container(
                              child: Image.network(
                                  "https://www.pngkit.com/png/full/217-2170686_belt-transparent-studded-studded-belt-transparent.png"),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(),
                      ),
                      Expanded(
                        flex: 10,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              e["title"].toString(),
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            Text("\$ " + e["price"].toString(),
                                style: TextStyle(
                                  fontSize: 15,
                                ))
                          ],
                        ),
                      ),
                    ],
                  ),
                ))
          ],
        ),
        drawer: SideDrawer(
          active: widget.active,
          change: widget.change,
        ));
  }
}
