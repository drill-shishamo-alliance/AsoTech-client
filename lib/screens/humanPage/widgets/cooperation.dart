import 'package:flutter/material.dart';

class Cooperation extends StatefulWidget {
  @override
  _CooperationState createState() => _CooperationState();
}

class _CooperationState extends State<Cooperation> {
  @override
  Widget build(BuildContext context) {
    return Align (
       alignment: Alignment.topLeft,
       child: Text("左上"),
      );
  }
}