import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/screen/user_edit_screen.dart';
import 'package:shop_app/widget/Appdrawer.dart';
import 'package:shop_app/widget/manageproductwidget.dart';
import '../provider/product_provider.dart';

class Manageproduct extends StatelessWidget {
  const Manageproduct({Key? key}) : super(key: key);
  static const manageproductpage = "/manageproductpage";

  Future<void> refresing(BuildContext context) async {
    await Provider.of<Productprovider>(context, listen: false).getproduct();
  }

  @override
  Widget build(BuildContext context) {
    //@override
    // void didChangeDependencies() {
    //   final getproduct = Provider.of<Productprovider>(context).getproduct();
    //
    //}
    final manageproduct = Provider.of<Productprovider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Product"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(Usereditscreen.routname);
              },
              icon: Icon(Icons.add))
        ],
      ),
      drawer: Appdrawer(),
      body: RefreshIndicator(
        onRefresh: () => refresing(context),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: manageproduct.items.isEmpty
              ? Center(child: Text("please add product"))
              : ListView.builder(
                  itemCount: manageproduct.items.length,
                  itemBuilder: (BuildContext context, int i) {
                    return Manageproductitem(
                        manageproduct.items[i].title!,
                        manageproduct.items[i].imageUrl!,
                        manageproduct.items[i].id!);
                  },
                ),
        ),
      ),
    );
  }
}
