import 'package:flutter/material.dart';

class DemonWidget extends StatefulWidget {
  @override
  _DemonWidgetState createState() => _DemonWidgetState();
}

class _DemonWidgetState extends State<DemonWidget> {
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new CircularProgressIndicator(),
    );
  }
}
