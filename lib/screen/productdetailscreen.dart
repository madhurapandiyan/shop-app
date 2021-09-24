import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/provider/product_provider.dart';
import 'package:shop_app/provider/productmodel.dart';

class Productdetail extends StatelessWidget {
  static const routename = "productdeatil";

  @override
  Widget build(BuildContext context) {
    final String? id = ModalRoute.of(context)!.settings.arguments as String?;
    final loadedprod = Provider.of<Productprovider>(context)
        .items
        .singleWhere((element) => element.id == id);

    final title =
        Provider.of<Productprovider>(context).items.firstWhere((element) {
      print(id);
      // ignore: unnecessary_statements
      return element.id == id;
    });

    return Scaffold(
      // appBar: AppBar(
      //   title: Text(title.title!),
      //   //backgroundColor: Colors.black12,
      // ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
           
            flexibleSpace: FlexibleSpaceBar(
              title: Text(title.title!),
              //collapseMode: CollapseMode.parallax,
             // centerTitle: true,
              background: Hero(tag: id!, child: Image.network(title.imageUrl!,fit: BoxFit.cover,),),
            ),
             pinned: true,
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            SizedBox(
              height: 20,
            ),
            Text(
              title.title!,
              style: Theme.of(context).textTheme.headline1,
            ),
            SizedBox(
              height: 2,
            ),
            Text(title.description!),
            SizedBox(
              height: 10,
            ),
            Text("Delivery options",
                style: Theme.of(context).textTheme.bodyText1),
                SizedBox(
                height: 800,
              ),
          ])
          ),
          
        ],

        // Expanded(
        //   child: ListView.builder(
        //     itemCount: 2,
        //     itemBuilder: (BuildContext context, int i) {
        //       return Column(
        //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         children: [
        //           Text("title.delivaryoption[i"),
        //           SizedBox(
        //             height: 5,
        //           )
        //         ],
        //       );
        //     },
        //   ),
        // ),
      ),
    );
  }
}
