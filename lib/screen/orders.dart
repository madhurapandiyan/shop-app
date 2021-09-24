import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/provider/cart.dart';
import 'package:shop_app/provider/ordermodel.dart';

class Orderscreen extends StatefulWidget {
  static const routename = "orderscreen";
  Orderscreen({Key? key}) : super(key: key);

  @override
  _OrderscreenState createState() => _OrderscreenState();
}

class _OrderscreenState extends State<Orderscreen> {
  

  @override
  Widget build(BuildContext context) {
    var expand = false;
   // print(expand);
    final orderproductitem = Provider.of<Orderitem>(context);
    final item = orderproductitem.order;
    //print(item.);
    // final cartitems = Provider.of<Cart>(context);
    // final items = cartitems.items;
    //print(orderproductitem.order.first.amount);

    return Scaffold(
      appBar: AppBar(
        title: Text("your orders"),
      ),
      body: Card(
        child: ListView.builder(
          itemCount: item.length,
          itemBuilder: (BuildContext context, int i) {
          return ExpansionTile(leading: CircleAvatar(backgroundImage: NetworkImage(item[i].products.imgurl),),childrenPadding: EdgeInsets.all(20),title: Text(item[i].products.title),children: [
            Container(
              width: double.infinity,
              height: 200,
              child: ListTile(
                leading: Image.network(item[i].products.imgurl),
              ),
            )
          ],);
         },
        ),
      ),
    );
  }
}
