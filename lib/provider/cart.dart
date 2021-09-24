import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

class Cartitem {
  String title;
  String id;
  double price;
  int quantity;
  String imgurl;
  Cartitem(
      {required this.id,
      required this.price,
      required this.quantity,
      required this.title,
      required this.imgurl});
}

class Cart with ChangeNotifier {
  Map<String, Cartitem> _items = {};
  Map<String, Cartitem> get items {
    return {..._items};
  }

  String? token;

  void update(String? tok) {
    token = tok;
  }

  Map<String, Cartitem> loaded = {};

  double get totali {
    var total = 0.0;
    _items.forEach((key, value) {
      total += value.price * value.quantity;
    });
    // print(total);
    return total;
  }

  int get item {
    return _items.length;
  }

  Future<void> getcartproduct() async {
    // print("get");
    final cartprodurl = Uri.parse(
        "https://project1-c1ac5-default-rtdb.firebaseio.com/cartproduct.json?auth=$token");
    try {
      if (loaded.isEmpty) {}
      final getcart = await get(cartprodurl);
      final extracted = jsonDecode(getcart.body) as Map<String, dynamic>;

      extracted.forEach((cartid, cartitem) {
        print(_items.containsKey(cartid));
        if (!_items.containsKey(cartid)) {
          print("if");
          _items.putIfAbsent(
              cartid,
              () => Cartitem(
                  id: cartitem["id"],
                  price: cartitem["price"],
                  quantity: cartitem["quantity"],
                  title: cartitem["title"],
                  imgurl: cartitem["imgurl"]));
          //_items = loaded;
        } else {
          print("else");
          _items.update(
              cartid,
              (_) => Cartitem(
                  id: cartitem["id"],
                  price: cartitem["price"],
                  quantity: cartitem["quantity"],
                  title: cartitem["title"],
                  imgurl: cartitem["imgurl"]));
        }

        //print(loaded.values.map((e) => print(e.title)));
        _items = loaded;
        //print(_items.values.first.title);
        print(items.values.last.quantity);
      });
    } catch (e) {
      throw e;
    }
  }

  Future<void> additems(
      String id, double price, String title, String url) async {
    //print("add");

    try {
      final cartprodurl = Uri.parse(
          "https://project1-c1ac5-default-rtdb.firebaseio.com/cartproduct.json?auth=$token");
      // print(id);
      //print(loaded.values.any((element) => element.id == id));
      //print(loaded.values.contains());

      if (loaded.values.any((element) => element.id == id)) {
        //print("if");
        final urli = Uri.parse(
            "https://project1-c1ac5-default-rtdb.firebaseio.com/cartproduct.json?auth=$token");
        final getres = await get(urli);
        final getdata = jsonDecode(getres.body) as Map<String, dynamic>;
        final iid = getdata.keys.last;
        //print(iid);
        final quantity = loaded.values.last;
        final updatingurl = Uri.parse(
            "https://project1-c1ac5-default-rtdb.firebaseio.com/cartproduct/$iid.json?auth=$token");
        // print("map");
        patch(updatingurl,
            body: jsonEncode({
              "title": title,
              "id": id,
              "price": price,
              "imgurl": url,
              "quantity": quantity.quantity + 1
            }));
        loaded.update(
            iid,
            (value) => Cartitem(
                id: value.id,
                price: value.price,
                quantity: value.quantity + 1,
                title: value.title,
                imgurl: value.imgurl));
      } else {
        await post(cartprodurl,
            body: jsonEncode({
              "title": title,
              "id": id,
              "price": price,
              "imgurl": url,
              "quantity": 1
            }));
        final getresponce = await get(cartprodurl);
        final data = jsonDecode(getresponce.body) as Map<String, dynamic>;
        //print(data);
        final cartid = data.keys.last;
        loaded.addAll({
          cartid: Cartitem(
              id: id, price: price, quantity: 1, title: title, imgurl: url)
        });
        //print(id);
        // print(loaded.keys.last);
        //_items = _items;
        //  print(_items);
        // print(_items.values.any((element) => element.id == id));
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> removesingelitem(String cartid) async {
    //print(cartid);
    final update = Uri.parse(
        "https://project1-c1ac5-default-rtdb.firebaseio.com/cartproduct.json?auth=$token");
    final getresponce = await get(update);
    final prod = jsonDecode(getresponce.body) as Map<String, dynamic>;

    //print(keys);
    final values = prod.values.last;
    print(_items.containsKey(cartid));
    try {
      if (!_items.containsKey(cartid)) {
        return;
      }
      if (_items.values.last.quantity > 1) {
        final update = Uri.parse(
            "https://project1-c1ac5-default-rtdb.firebaseio.com/cartproduct/$cartid.json?auth=$token");

        await patch(update,
            body: jsonEncode({
              "title": values["title"],
              "id": values["id"],
              "price": values["price"],
              "imgurl": values["imgurl"],
              "quantity": values["quantity"] - 1
            }));
        _items.update(
            cartid,
            (values) => Cartitem(
                id: values.id,
                price: values.price,
                quantity: values.quantity - 1,
                title: values.title,
                imgurl: values.imgurl));
      } else {
        print("else");
        final update = Uri.parse(
            "https://project1-c1ac5-default-rtdb.firebaseio.com/cartproduct/$cartid.json?auth=$token");
        final del = await delete(update);
        print(del.statusCode);
        _items.remove(cartid);
        print(_items);
      }
    } catch (e) {
      print(e);
    }
  }
  //   if (!_items.containsKey(productid)) {
  //     return;
  //   }
  //   if (_items[productid]!.quantity > 1) {
  //     _items.update(
  //         productid,
  //         (value) => Cartitem(
  //             id: value.id,
  //             price: value.price,
  //             quantity: value.quantity - 1,
  //             title: value.title,
  //             imgurl: value.imgurl));
  //   } else {
  //     _items.remove(productid);
  //   }
  // }

  void remove(String id) {
    _items.remove(id);
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }

  void clearcartitem(String id) {
    if (_items.containsKey(id)) {
      _items.remove(id);
    }

    notifyListeners();
  }

  notifyListeners();

  // void change() {
  //   notifyListeners();
  // }
}
