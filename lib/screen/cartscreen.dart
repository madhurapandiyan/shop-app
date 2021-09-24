import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/provider/cart.dart';
import 'package:shop_app/provider/ordermodel.dart';
import 'package:shop_app/widget/Appdrawer.dart';
import 'package:shop_app/widget/cartlist.dart';

class Cartscreen extends StatefulWidget {
  const Cartscreen({Key? key}) : super(key: key);
  static const routename = "cardscreen";

  @override
  _CartscreenState createState() => _CartscreenState();
}

class _CartscreenState extends State<Cartscreen> {
  bool isinit = true;
  bool isloading = false;
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    //print("irst");
    if (isinit) {
      isloading = true;
      Provider.of<Cart>(context).getcartproduct().then((_) {
        isloading = false;
        isinit = false;
      });
    }
  }

  Future<void> refresing(BuildContext context) async {
    await Provider.of<Cart>(context, listen: false).getcartproduct();
  }

  @override
  Widget build(BuildContext context) {
    @override
    final cartitems = Provider.of<Cart>(context);
    final items = cartitems.items;
    //print(items.values.first.title);
    final orderproductitem = Provider.of<Orderitem>(context);
    final orderlist = orderproductitem.order;
    final ordercart = items.values.toList();

    return Scaffold(
      appBar: AppBar(
        title: Text("cart"),
      ),
      drawer: Appdrawer(),
      body: !isloading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : RefreshIndicator(
              onRefresh: () => refresing(context),
              child: Column(
                children: [
                  Container(
                    height: 70,
                    width: double.infinity,
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(color: Colors.black),
                      BoxShadow(color: Colors.white)
                    ]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("deliver to " + "location"),
                        Container(
                          height: 40,
                          width: 100,
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(color: Colors.black),
                            BoxShadow(color: Colors.white)
                          ]),
                          child: Center(child: Text("change")),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (BuildContext context, int index) {
                        //print(items.values.toList()[index].title);

                        return Cartlist(
                          keye: items.keys.toList()[index],
                          id: items.values.toList()[index].id,
                          price: items.values.toList()[index].price,
                          quantity: items.values.toList()[index].quantity,
                          url: items.values.toList()[index].imgurl,
                          title: items.values.toList()[index].title,
                        );
                      },
                    ),
                  ),
                  Stack(children: [
                    Container(
                      width: double.infinity,
                      height: 70,
                      color: Theme.of(context).primaryColor,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Total ${cartitems.totali.toStringAsFixed(0)}",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                        InkWell(
                          onTap: () {
                            for (var i = 0; i < ordercart.length; i++) {
                              orderproductitem.addorders(
                                  ordercart[i], cartitems.totali);
                            }
                            cartitems.clear();
                          },
                          child: Container(
                            alignment: Alignment.topCenter,
                            //padding: EdgeInsets.all(10),
                            margin:
                                EdgeInsets.only(left: 20, top: 10, bottom: 10),
                            width: 120,
                            height: 40,

                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: Center(
                                child: Text(
                              "place the order",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                            )),
                          ),
                        ),
                      ],
                    )
                  ])
                ],
              ),
            ),
    );
  }
}
