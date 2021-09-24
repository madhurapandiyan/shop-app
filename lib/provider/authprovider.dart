import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_app/model/http_exception.dart';

class Authprovider with ChangeNotifier {
  String? _token = "";
  DateTime? _expirydate = DateTime.now();
  String? uid = "";

  String? get token {
    if (_expirydate!.isAfter(DateTime.now())) {
      print("true");
      return _token;
    } else if (_expirydate == null) {
      return "";
    }
  }

  bool get isauth {
    return token != null;
  }

  Future<void> authentication(
      String? name, String? password, String urlink) async {
    try {
      final url = Uri.parse(
          "https://identitytoolkit.googleapis.com/v1/accounts:$urlink\key=AIzaSyBjK4QBsIKfCwu9atla6ksDy2Bn7L24VjM");

      final responce = await http.post(url, body: {
        "email": name,
        "password": password,
        "returnSecureToken": "true"
      });

      final responcedata = jsonDecode(responce.body) as Map<String, dynamic>;
      print(responcedata);
      if (responcedata["error"] != null) {
        throw HttpException(responcedata["error"]["message"]);
      }
      _token = responcedata["idToken"];
      _expirydate = DateTime.now()
          .add(Duration(seconds: int.parse(responcedata["expiresIn"])));
      uid = responcedata["localId"];
      //print(token);
    } catch (e) {
      //print(e);
      throw e;
    }
    autologout();
    final pref = await SharedPreferences.getInstance();
    final userdata = jsonEncode(
        {"token": _token, "uid": uid, "expirydate": _expirydate!.toString()});
    pref.setString("userdata", userdata);

    notifyListeners();
  }

  Future<bool> autologin() async {
    final pref = await SharedPreferences.getInstance();

    if (!pref.containsKey("userdata")) {
      return false;
    } else {
      final data = pref.getString("userdata");
      //print(json.decode(data!));
      final extracteddata = json.decode(data!) as Map<String, dynamic>;
      print(extracteddata["expirydate"]);
      try {
        var date = extracteddata["expirydate"];
        DateTime expirydate = DateTime.parse(date);
        //print(expirydate);
        //print(!expirydate.isBefore(DateTime.now()));
        if (expirydate.isBefore(DateTime.now())) {
          print("sed");
          return false;
        }
        _expirydate = expirydate;
        _token = extracteddata["token"];
        uid = extracteddata["uid"];
      } catch (e) {
        print(e);
      }

      //print(_token);
      autologout();
      notifyListeners();
      return true;
    }
  }

  Future<void> logout() async {
    try {
      _token = null;
       uid = null;

     
      final pref = await SharedPreferences.getInstance();
      pref.clear();

      //print(_expirydate);
     // print(_token);
      //print(uid);
    } catch (e) {
      print(e);
    }

    notifyListeners();
  }

  void autologout() {
    final timetoexpiry = _expirydate!.difference(DateTime.now()).inSeconds;
    Timer(Duration(seconds: timetoexpiry), logout);
  }
}
