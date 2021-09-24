import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Pagetransistionbuilder extends PageTransitionsBuilder {
  //Pagetransistionbuilder(RoutePageBuilder pagebuilder)
  //
  @override
  Widget buildTransitions<T>(
      PageRoute<T> route,
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    // TODO: implement buildTransitions
    if (route.settings.name == "/") {
      return child;
    }
    return FadeTransition(opacity: animation);
  }

  // @override
  // Widget buildTransitions<T>(BuildContext context, Animation<double> animation,PageRoute<T> route,
  //     Animation<double> secondaryAnimation, Widget child) {
  //   if (route.settings.name == "/") {
  //     return child;
  //   }
  //   return SizeTransition(sizeFactor: animation);
  // }
}
