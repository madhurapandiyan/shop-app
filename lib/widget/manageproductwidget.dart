import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/provider/product_provider.dart';
import 'package:shop_app/screen/user_edit_screen.dart';

class Manageproductitem extends StatelessWidget {
  final String title;
  final String url;
  final String id;

  Manageproductitem(this.title, this.url, this.id);
  @override
  Widget build(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    return Column(
      children: [
        ListTile(
          leading: Image.network(url),
          title: Text(title),
          trailing: Container(
            width: 100,
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed(Usereditscreen.routname, arguments: id);
                    },
                    icon: Icon(Icons.edit)),
                IconButton(
                    onPressed: () async {
                      try {
                        await Provider.of<Productprovider>(context,
                                listen: false)
                            .deleteproduct(id);
                      } catch (e) {
                        scaffold.showSnackBar(
                            SnackBar(content: Text(e.toString())));
                      }
                    },
                    icon: Icon(
                      Icons.delete,
                      color: Colors.red,
                    ))
              ],
            ),
          ),
        ),
        SizedBox(
          height: 10,
        )
      ],
    );
  }
}
