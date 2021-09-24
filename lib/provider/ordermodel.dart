import 'package:flutter/cupertino.dart';
import 'cart.dart';

class Ordermodel {
  
  final String id;
  final Cartitem products;

  final DateTime date;

  Ordermodel(
      {required this.id,
      
      required this.products,
      required this.date});
}

class Orderitem with ChangeNotifier {
  bool count = false;
  List<Ordermodel> _order = [];
  List<Ordermodel> get order {
    return [..._order];
  }

  void addorders(Cartitem cartproducts, double total) {
    //print(Cart().totali);
    _order.insert(
        0,
        Ordermodel(
            id: DateTime.now().toString(),
            
            products: cartproducts,
            date: DateTime.now()));
    print(_order[0].products.price);
    notifyListeners();
    //print(items.first.amount);
  }

  notifyListeners();
}
