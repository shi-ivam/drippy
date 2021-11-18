import 'package:flutter/material.dart';

class ThirdRoute extends StatefulWidget {
  const ThirdRoute(
      {Key? key,
      required this.active,
      required this.change,
      required this.cartItems,
      required this.removeFromCart})
      : super(key: key);
  final active;
  final change;
  final cartItems;
  final removeFromCart;

  @override
  _ThirdRouteState createState() => _ThirdRouteState();
}

class _ThirdRouteState extends State<ThirdRoute> {
  @override
  Widget build(BuildContext context) {
    print('-------');
    print(widget.cartItems);
    print('cart rebuild');
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: ListView(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
        children: [
          ...widget.cartItems.map(
            (e) => Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(
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
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
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
                                  widget.removeFromCart(e);
                                  Navigator.of(context).pop();
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ThirdRoute(
                                              active: widget.active,
                                              change: widget.change,
                                              cartItems: widget.cartItems
                                                  .where((element) =>
                                                      (element["key"]
                                                              .toString() !=
                                                          e["key"].toString()))
                                                  .toList(),
                                              removeFromCart:
                                                  widget.removeFromCart)));
                                },
                                child: Text('Remove'),
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
      // drawer: SideDrawer(
      //   active: active,
      //   change: change,
      // ),
    );
  }
}
