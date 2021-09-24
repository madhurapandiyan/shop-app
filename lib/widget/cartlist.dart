import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/provider/cart.dart';
import 'package:shop_app/provider/ordermodel.dart';

class Cartlist extends StatefulWidget {
  final String url;
  final String title;
  final double price;
  final int quantity;
  final String id;
  final String keye;
  //final Function removecartitem;
  //final Iterable<Cartitem> mappiy;
  Cartlist(
      {required this.id,
      required this.price,
      required this.quantity,
      required this.title,
      required this.url,
      required this.keye});

  @override
  _CartlistState createState() => _CartlistState();
}

class _CartlistState extends State<Cartlist> {
  @override
  Widget build(BuildContext context) {
    print(widget.id);
    
    //final cart = ;
    //final item = cart.items;
    //print(mappiy.first.title);
    return Dismissible(
      key: ValueKey(widget.keye),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) {
        return showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
                  title: Text("Are You Sure"),
                  content: Text("Do you want to remove the item from cart"),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(ctx).pop(
                            false,
                          );
                        },
                        child: Text("NO")),
                    TextButton(
                        onPressed: () {
                          Navigator.of(ctx).pop(true);
                        },
                        child: Text("YES"))
                  ],
                ));
      },
      onDismissed: (direction) {
        Provider.of<Cart>(context, listen: false).remove(widget.keye);
      },
      child: ListTile(
        leading: Image.network(widget.url),title: Text(widget.title),subtitle: Row(
        
        children: [
        Column(
         // mainAxisAlignment: MainAxisAlignment.start,
          children: [Text("price",style: TextStyle(fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor),),
            Text(widget.price.toString()),
          ],
        ),
        SizedBox(width: 10,),
        Column(
          children: [
            Text("quantity",style: TextStyle(fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor),),
            Text(widget.quantity.toString()),
          ],
        )
      ],),
      trailing: FittedBox(
        child: Row(mainAxisAlignment: MainAxisAlignment.end,
          children: [
          IconButton(onPressed: (){}, icon: Icon(Icons.save)),
          IconButton(onPressed: (){}, icon: Icon(Icons.delete))
        ],),
      ),) 
      // Container(
      //     height: 200,
      //     width: double.infinity,
      //     decoration: BoxDecoration(boxShadow: [
      //       BoxShadow(color: Colors.blue[300]),
      //       BoxShadow(color: Colors.white)
      //     ]),
      //     child: GridTile(
      //       footer: Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceAround,
      //         children: [
      //           Padding(
      //             padding: const EdgeInsets.all(8.0),
      //             child: Container(
      //               height: 40,
      //               width: 150,
      //               decoration: BoxDecoration(
      //                   color: Colors.amberAccent,
      //                   borderRadius: BorderRadius.circular(10),
      //                   boxShadow: [
      //                     BoxShadow(color: Colors.blue[300]),
      //                     BoxShadow(color: Colors.white)
      //                   ]),
      //               child: Center(
      //                   child: Text(
      //                 "save for later",
      //                 style: Theme.of(context).textTheme.bodyText1,
      //               )),
      //             ),
      //           ),
      //           Padding(
      //             padding: const EdgeInsets.all(8.0),
      //             child: InkWell(
      //               onTap: () {
      //                 setState(() {
      //                   Cart().clearcartitem(widget.id);
      //                 });
      //               },
      //               child: Container(
      //                 height: 40,
      //                 width: 150,
      //                 decoration: BoxDecoration(
      //                     color: Colors.amberAccent,
      //                     borderRadius: BorderRadius.circular(10),
      //                     boxShadow: [
      //                       BoxShadow(color: Colors.blue[300]),
      //                       BoxShadow(color: Colors.white)
      //                     ]),
      //                 child: Center(child: Text("order now")),
      //               ),
      //             ),
      //           ),
      //         ],
      //       ),
      //       child: Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //         children: [
      //           Padding(
      //             padding: const EdgeInsets.all(25.0),
      //             child: Column(
      //               children: [
      //                 Text(widget.title),
      //                 SizedBox(
      //                   height: 10,
      //                 ),
      //                 SizedBox(
      //                   height: 10,
      //                 ),
      //                 Container(
      //                   height: 30,
      //                   width: 100,
      //                   decoration: BoxDecoration(
      //                       color: Colors.amberAccent,
      //                       borderRadius: BorderRadius.circular(
      //                         10,
      //                       ),
      //                       boxShadow: [
      //                         BoxShadow(color: Colors.amberAccent),
      //                         BoxShadow(color: Colors.blue[300])
      //                       ]),
      //                   child: Center(child: Text("${widget.price}")),
      //                 )
      //               ],
      //             ),
      //           ),
      //           Column(
      //             children: [
      //               Padding(
      //                 padding: const EdgeInsets.all(8.0),
      //                 child: Container(
      //                     height: 100,
      //                     width: 100,
      //                     child: Image.network(widget.url)),
      //               ),
      //               SizedBox(
      //                 height: 5,
      //               ),
      //               Container(
      //                 height: 40,
      //                 width: 60,
      //                 // color: Colors.amberAccent,
      //                 decoration: BoxDecoration(
      //                     color: Colors.amberAccent,
      //                     boxShadow: [
      //                       BoxShadow(color: Colors.blue[300]),
      //                       BoxShadow(color: Colors.white)
      //                     ]),
      //                 child: Center(
      //                     child: Column(
      //                   children: [
      //                     Text("Qty"),
      //                     Text(widget.quantity.toString())
      //                   ],
      //                 )),
      //               ),
      //             ],
      //           )
      //         ],
      //       ),
      //       //header: Text(",man")
      //     )),
    );
  }
}
