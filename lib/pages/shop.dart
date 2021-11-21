import 'dart:convert';
import '../classes/product.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
  late Future<dynamic> futureProduct;

  Future fetchProducts() async {
    final response =
        await http.get(Uri.parse('https://fakestoreapi.com/products'));
    // print(jsonDecode(response.body));

    // Convert List to Specific Products

    var finalP = [];

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      // print(response.body);
      var res = await jsonDecode(response.body);

      for (var x = 0; x < (res).length; x++) {
        // finalP.add(Product.fromJson(jsonDecode(res[x])));
        finalP.add(Product.fromJson(res[x]));
      }
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
    return finalP;
  }

  @override
  void initState() {
    super.initState();
    futureProduct = fetchProducts();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Shop'),
        ),
        body: Container(
          child: FutureBuilder<dynamic>(
            future: futureProduct,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                  children: [
                    ...snapshot.data.map(
                      (e) => Container(
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
                                    child: Image.network(e.image),
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
                                    e.title.toString(),
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text("\$ " + e.price.toString(),
                                      style: TextStyle(
                                        fontSize: 12,
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
                                            style:
                                                TextStyle(color: Colors.white),
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
                      ),
                    )
                  ],
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return Center(
                child: const CircularProgressIndicator(),
              );
            },
          ),
        )
        // drawer: SideDrawer(
        //   active: widget.active,
        //   change: widget.change,
        // ),
        );
  }
}
