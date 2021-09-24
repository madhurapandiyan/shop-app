import 'package:flutter/material.dart';
import 'package:shop_app/helper/pageroutetransition.dart';
import 'package:shop_app/provider/authprovider.dart';
import 'package:shop_app/provider/cart.dart';
import 'package:shop_app/provider/ordermodel.dart';
import 'package:shop_app/provider/product_provider.dart';
import 'package:shop_app/screen/auth_screen.dart';
import 'package:shop_app/screen/cartscreen.dart';
import 'package:shop_app/screen/manageproductscreen.dart';
import 'package:shop_app/screen/orders.dart';
import 'package:shop_app/screen/productdetailscreen.dart';
import 'package:shop_app/screen/shopapphomepage.dart';
import 'package:provider/provider.dart';

import 'package:shop_app/screen/user_edit_screen.dart';
import 'package:shop_app/widget/splashscreen.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();

  runApp(Shopapp());
}

class Shopapp extends StatelessWidget {
  const Shopapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print(FirebaseFirestore.instance.collection("user").snapshots());
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (ctx) => Authprovider()),
          // ChangeNotifierProvider(
          //   create: (ctx) => Productprovider(Authprovider().token, []),
          // ),

          ChangeNotifierProxyProvider<Authprovider, Productprovider>(
              create: (_) => Productprovider(),
              update: (ctx, auth, pr) =>
                  pr!..update(auth.token, pr.items, auth.uid)),
          //(create: (ctx) => Productprovider()),
          ChangeNotifierProxyProvider<Authprovider, Cart>(
              create: (ctx) => Cart(),
              update: (ctx, auth, cart) => cart!..update(auth.token)),
          ChangeNotifierProvider(create: (ctx) => Orderitem())
        ],
        child: Consumer<Authprovider>(
          builder: (ctx, auth, _) => MaterialApp(
            debugShowCheckedModeBanner: false,
            title: "Shop app",
            theme: ThemeData(
                primaryColor: Colors.redAccent[400],
                accentColor: Colors.white,
                fontFamily: "Poppins",
                textTheme: ThemeData.light().textTheme.copyWith(
                    headline1: TextStyle(
                      fontFamily: "Poppins",
                      color: Colors.black,
                      fontSize: 25,
                    ),
                    bodyText1: TextStyle(
                        fontFamily: "Poppins",
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        letterSpacing: 2)),
                pageTransitionsTheme: PageTransitionsTheme(builders: {
                  TargetPlatform.android: Pagetransistionbuilder(),
                  //TargetPlatform.windows:Pagetransistionbuilder()
                })),
            home: auth.isauth
                ? Producthome()
                : FutureBuilder(
                    future: auth.autologin(),
                    builder: (ctx, authsnapshot) {
                      if (authsnapshot.connectionState ==
                          ConnectionState.waiting) {
                        return Splashscreen("waiting");
                      }
                      if (auth.isauth) {
                        return Producthome();
                      }

                      return AuthScreen();
                    },
                  ),
            routes: {
              Productdetail.routename: (ctx) => Productdetail(),
              Cartscreen.routename: (ctx) => Cartscreen(),
              Producthome.routename: (ctx) => Producthome(),
              Orderscreen.routename: (ctx) => Orderscreen(),
              Manageproduct.manageproductpage: (ctx) => Manageproduct(),
              Usereditscreen.routname: (ctx) => Usereditscreen()
            },
          ),
        ));
  }
}

// class Firebases extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: StreamBuilder(
//           stream: FirebaseFirestore.instance.collection("user").snapshots(),
//           builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
//             return ListView.builder(
//               itemCount: 1,
//               itemBuilder: (BuildContext context, int index) {
//                 return ListTile(
//                   leading: Text("mappiy"),
//                   trailing: Text("mappiy"),
//                 );
//               },
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
