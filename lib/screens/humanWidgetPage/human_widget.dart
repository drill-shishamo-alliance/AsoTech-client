import 'package:flutter/material.dart';

class HumanWidget extends StatefulWidget {
  @override
  _HumanWidgetState createState() => _HumanWidgetState();
}

class _HumanWidgetState extends State<HumanWidget> {
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new CircularProgressIndicator(),
    );
  }
}
