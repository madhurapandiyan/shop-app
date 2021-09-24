import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart ' as http;
import 'package:http/http.dart';

import 'package:shop_app/provider/productmodel.dart';

class Productprovider with ChangeNotifier {
  String? authtoken;
  String? _uid;
  //Productprovider(this.authtoken, this._items);
  List<Product> _items = [];
  List<Product> get items {
    return [..._items];
  }

  void update(String? tok, List<Product> itemz, String? userid) {
    authtoken = tok;
    _items = itemz;
    _uid = userid;
  }

  //var showonlyfav = false;

  List<Product> get showfav {
    return _items.where((element) => element.isfavourite).toList();
  }

  Product findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  Future<void> addproduct(Product product) async {
    final url = Uri.parse(
        "https://project1-c1ac5-default-rtdb.firebaseio.com/$_uid/product.json?auth=$authtoken");

    try {
      final value = await post(url,
          body: jsonEncode({
            "title": product.title,
            "descrption": product.description,
            "price": product.price,
            "isfav": product.isfavourite,
            "imgurl": product.imageUrl
          }));
      print(json.decode(value.body));
      Product addproduct = Product(
        isfavourite: product.isfavourite,
        id: json.decode(value.body)["name"],
        title: product.title,
        description: product.description,
        price: product.price,
        imageUrl: product.imageUrl,
      );
      _items.add(addproduct);

      notifyListeners();
    } catch (e) {
      throw e;
    }
  }

  Future<void> updateproduct(Product uproduct) async {
    var prodid = uproduct.id;
    final url = Uri.parse(
        "https://project1-c1ac5-default-rtdb.firebaseio.com/$_uid/product/$prodid.json?auth=$authtoken");
    try {
      final response = await patch(url,
          body: jsonEncode({
            "title": uproduct.title,
            "imgurl": uproduct.imageUrl,
            "descrption": uproduct.description,
            "price": uproduct.price
          }));
      int id = _items.indexWhere((element) => element.id == uproduct.id);
      _items.removeAt(id);
      _items.insert(id, uproduct);
    } catch (e) {
      throw e;
    }

    notifyListeners();
  }

  Future<void> getproduct() async {
    print("get");
    //print(authtoken);
    final url = Uri.parse(
        "https://project1-c1ac5-default-rtdb.firebaseio.com/$_uid/product.json?auth=$authtoken");
    final url1 = Uri.parse(
        "https://project1-c1ac5-default-rtdb.firebaseio.com/$_uid/favourite_status.json?auth=$authtoken");
    try {
      final response = await get(
        url,
      );
      final favstatusres = await get(url1);
      var status = jsonDecode(favstatusres.body);
     // print(jsonDecode(favstatusres.body));

      // print(response.statusCode);
      //print(jsonDecode(favstatusres.body));
      List<Product> loadeditem = [];
      final extractdata =
          await jsonDecode(response.body) as Map<String, dynamic>;

      //print(extractdata);

      extractdata.forEach((id, value) {
        // print(id);
        // print(value["descrption"]);
        // print(value["title"]);
        // print(value["price"]);
        // print(value["imgurl"]);
        //
        //print(value["price"]);
        loadeditem.add(Product(
            isfavourite: status[id],
            id: id,
            title: value["title"],
            description: value["descrption"],
            price: value["price"],
            imageUrl: value["imgurl"]));
        //print(loadeditem);
        _items = loadeditem;
        //print(_items.length);
      });
      //_items = _items;
      notifyListeners();
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Future<void> deleteproduct(String id) async {
    final url = Uri.parse(
        "https://project1-c1ac5-default-rtdb.firebaseio.com/$_uid/product/$id.json?auth=$authtoken");

    var product = _items.firstWhere((element) => element.id == id);
    final productindex = _items.indexOf(product);
    // print(productindex);
    //print(product.id);
    _items.removeWhere((element) => element.id == id);
    notifyListeners();

    final responce = await delete(url);
    if (responce.statusCode >= 400) {
      _items.insert(productindex, product);
      notifyListeners();
      throw Exception("Deleting failed");
    }
  }
}
