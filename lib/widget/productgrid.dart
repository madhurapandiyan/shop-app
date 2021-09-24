import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/widget/productitem.dart';
import '../provider/product_provider.dart';

class Productgrid extends StatelessWidget {
  var showfav;
  Productgrid(this.showfav);
  @override
  Widget build(BuildContext context) {
    final productdata = Provider.of<Productprovider>(context,listen: false);
    final productlist = showfav ? productdata.showfav : productdata.items;
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount:2,
          childAspectRatio: 5 / 7,
      // mainAxisExtent:0,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: productlist[i],
        child: Productitem(),
      ),
      itemCount: productlist.length,
    );
  }
}







/*body: Card(
        child: Column(
          children: [
            ListView.builder(
              itemCount: item.length,
              itemBuilder: (BuildContext context, int i) {
              return ListTile(
              leading: CircleAvatar(
                child: FittedBox(
                  child: Text(item[i].amount.toString()),
                ),
              ),
            ) ;
             },
            ),
          ],
        ),
      ),
    );*/