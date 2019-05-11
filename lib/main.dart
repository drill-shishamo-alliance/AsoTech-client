import 'package:flutter/material.dart';

import 'screens/demonPage/demon.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Weather Application',
      theme: new ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: new Demon(),
    );
  }
}
