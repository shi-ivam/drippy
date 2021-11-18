import 'package:flutter/material.dart';

class SecondRoute extends StatefulWidget {
  const SecondRoute(
      {Key? key,
      required this.active,
      required this.change,
      required this.addToCart})
      : super(key: key);
  final active;
  final addToCart;
  final change;

  @override
  _SecondRouteState createState() => _SecondRouteState();
}

class _SecondRouteState extends State<SecondRoute> {
  var items = [
    {
      "key": "1",
      "title": "Shoes",
      "price": 24.99,
    },
    {
      "key": "2",
      "title": "Shirt",
      "price": 29.99,
    },
    {
      "key": "3",
      "title": "Belt",
      "price": 10.99,
    },
    {
      "key": "4",
      "title": "Beslt",
      "price": 12.99,
    },
    {
      "key": "5",
      "title": "Shoes",
      "price": 24.99,
    },
    {
      "key": "6",
      "title": "Shirt",
      "price": 29.99,
    },
    {
      "key": "7",
      "title": "Belt",
      "price": 10.99,
    },
    {
      "key": "7",
      "title": "Beslt",
      "price": 12.99,
    },
    {
      "key": "8",
      "title": "Shoes",
      "price": 24.99,
    },
    {
      "key": "9",
      "title": "Shirt",
      "price": 29.99,
    },
    {
      "key": "10",
      "title": "Belt",
      "price": 10.99,
    },
    {
      "key": "11",
      "title": "Beslt",
      "price": 12.99,
    },
    {
      "key": "12",
      "title": "Shoes",
      "price": 24.99,
    },
    {
      "key": "13",
      "title": "Shirt",
      "price": 29.99,
    },
    {
      "key": "14",
      "title": "Belt",
      "price": 10.99,
    },
    {
      "key": "15",
      "title": "Beslt",
      "price": 12.99,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shop'),
      ),
      body: ListView(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
        children: [
          ...items.map((e) => Container(
                padding: EdgeInsets.all(10),
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
                      flex: 5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            e["title"].toString(),
                            style: TextStyle(
                              fontSize: 22,
                            ),
                          ),
                          Text("\$ " + e["price"].toString(),
                              style: TextStyle(
                                fontSize: 15,
                              ))
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(),
                    ),
                    Expanded(
                      flex: 6,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: FlatButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Buy Now',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  color: Colors.blueAccent,
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: OutlineButton(
                                  onPressed: () {
                                    widget.addToCart(e);
                                  },
                                  child: Text('Add To Cart'),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ))
        ],
      ),
      // drawer: SideDrawer(
      //   active: widget.active,
      //   change: widget.change,
      // ),
    );
  }
}
