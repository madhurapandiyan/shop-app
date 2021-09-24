import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/provider/authprovider.dart';
import 'package:shop_app/screen/manageproductscreen.dart';
import 'package:shop_app/screen/orders.dart';
import 'package:shop_app/screen/shopapphomepage.dart';

class Appdrawer extends StatelessWidget {
  const Appdrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: Text(
              "Home",
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.shop,
              color: Theme.of(context).primaryColor,
            ),
            title: Text("shop"),
            onTap: () {
              Navigator.of(context).pushNamed(Producthome.routename);
            },
          ),
          Divider(),
          ListTile(
              leading:
                  Icon(Icons.payment, color: Theme.of(context).primaryColor),
              title: Text("Orders"),
              onTap: () {
                Navigator.of(context).pushNamed(Orderscreen.routename);
              }),
          Divider(),
          ListTile(
              leading: Icon(Icons.manage_accounts,
                  color: Theme.of(context).primaryColor),
              title: Text("Manage Products"),
              onTap: () {
                Navigator.of(context)
                    .pushNamed(Manageproduct.manageproductpage);
              }),
          Divider(),
          ListTile(
              leading:
                  Icon(Icons.logout, color: Theme.of(context).primaryColor),
              title: Text("logout"),
              onTap: () {
                // Navigator.of(context)
                //     .pop();
                Provider.of<Authprovider>(context,listen: false).logout();
              })
        ],
      ),
    );
  }
}
