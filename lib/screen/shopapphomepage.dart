import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/provider/product_provider.dart';
import 'package:shop_app/screen/cartscreen.dart';
import 'package:shop_app/widget/Appdrawer.dart';
import 'package:shop_app/widget/productgrid.dart';

// ignore: must_be_immutable

enum Filtered { mappiy, loosu }

class Producthome extends StatefulWidget {
  static const routename = "homepage";
  @override
  _ProducthomeState createState() => _ProducthomeState();
}

class _ProducthomeState extends State<Producthome> {
  var showfavourite = false;
  bool isinit = true;
  bool isloading = false;
  @override
  void didChangeDependencies() {
    //print("didchange");
    if (isinit) {
      isloading = true;
      Provider.of<Productprovider>(context)
          .getproduct()
          .then((_) => isloading = false);
    }
    isinit = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("shopapp"),
        actions: [
          Stack(children: [
            Center(
              //   child: CircleAvatar(
              // radius: 12,
              // foregroundColor: Colors.black,
              child:
                  //   Text(itemscount.item.toString())),
                  // ),
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(Cartscreen.routename);
                      },
                      icon: Icon(Icons.shopping_bag_outlined)),
            )
          ]),
          PopupMenuButton(
              onSelected: (Filtered selectedvalue) {
                setState(() {
                  if (selectedvalue == Filtered.mappiy) {
                    showfavourite = true;
                  } else {
                    showfavourite = false;
                  }
                });
              },
              icon: Icon(Icons.more_vert),
              itemBuilder: (ctx) => [
                    PopupMenuItem(
                      child: Text("only favorite"),
                      value: Filtered.mappiy,
                    ),
                    PopupMenuItem(
                      child: Text("all favorite"),
                      value: Filtered.loosu,
                    )
                  ]
                  )
        ],
      ),
      drawer: Appdrawer(),
      //backgroundColor: Theme.of(context).primaryColor,
      body: isloading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Productgrid(showfavourite),
    );
  }
}
