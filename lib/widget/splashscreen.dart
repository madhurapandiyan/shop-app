import 'package:flutter/material.dart';

class Splashscreen extends StatelessWidget {
  final String loadingtext;

  Splashscreen(this.loadingtext);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(loadingtext),
      ),
    );
  }
}
