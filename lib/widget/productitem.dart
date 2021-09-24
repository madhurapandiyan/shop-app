import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/provider/authprovider.dart';
import 'package:shop_app/provider/cart.dart';
import 'package:shop_app/screen/productdetailscreen.dart';

import '../provider/productmodel.dart';

class Productitem extends StatelessWidget {
  // final String title;
  // final String imageurl;
  // final String id;
  // Productitem(this.imageurl, this.title, this.id);

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Product>(context);
    final cartitems = Provider.of<Cart>(context);
    final authtoken = Provider.of<Authprovider>(context);
    // print(products.isfavourite);
    // final isfavourite = products.isfavourite;
    // final title = products.title;
    // final id = products.id;
    // final imageurl = products.imageUrl;
    return Padding(
      padding: EdgeInsets.all(10),
      child: Card(
        elevation: 20,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: GridTile(
            child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context,Productdetail.routename,
                      arguments: products.id);
                },
                child: Hero(
                  tag: products.id!,
                  child: FadeInImage(
                    placeholder: AssetImage("assets/images/lot.gif"),
                    image: NetworkImage(
                      products.imageUrl!,
                    ),
                    fit: BoxFit.cover,
                  ),
                )
                // Image.network(
                //   products.imageUrl!,
                //   fit: BoxFit.cover,
                // ),
                ),
            footer: GridTileBar(
              backgroundColor: Colors.black,
              leading: Consumer<Product>(
                builder: (BuildContext ctx, products, _) => IconButton(
                  color: Theme.of(context).accentColor,
                  icon: products.isfavourite == false
                      ? Icon(
                          Icons.favorite_border_outlined,
                          //color: Theme.of(context).accentColor,
                        )
                      : Icon(
                          Icons.favorite,
                          color: Theme.of(context).primaryColor,
                        ),
                  onPressed: () => products.togglestatus(
                      products, authtoken.token, authtoken.uid!),
                ),
              ),
              title: Center(
                  child: FittedBox(
                      child: Text(
                products.title!,
              ))),
              trailing: IconButton(
                color: Theme.of(context).accentColor,
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  cartitems
                      .additems(products.id!, products.price!, products.title!,
                          products.imageUrl!)
                      .then((_) {
                    Scaffold.of(context).hideCurrentSnackBar();
                    Scaffold.of(context).showSnackBar(SnackBar(
                      duration: Duration(seconds: 5),
                      content: Text("Item added to cart"),
                      action: SnackBarAction(
                        label: "UNDO",
                        onPressed: () {
                          cartitems.removesingelitem(cartitems.items.keys.last);
                        },
                      ),
                    ));
                  });

                  // ignore: deprecated_member_use
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
