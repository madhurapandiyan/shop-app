import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Product with ChangeNotifier {
  String? id;
  String? title;
  String? description;
  double? price;
  String? imageUrl;
  bool isfavourite;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
    this.isfavourite = false,
  });

  Future<void> togglestatus(
      Product product, String? token, String userid) async {
    try {
      id = product.id;
      isfavourite = !isfavourite;

      final url = Uri.parse(
          "https://project1-c1ac5-default-rtdb.firebaseio.com/$userid/favourite_status/$id.json?auth=$token");
      put(url, body: jsonEncode(isfavourite));
    } catch (e) {
      print(e);
    }

    notifyListeners();
  }

  Product copyWith({
    String? id,
    String? title,
    String? description,
    double? price,
    String? imageUrl,
  }) {
    return Product(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        price: price ?? this.price,
        imageUrl: imageUrl ?? this.imageUrl);
  }
}
