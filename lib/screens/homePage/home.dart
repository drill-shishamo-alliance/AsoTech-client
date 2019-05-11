import 'package:asotech_client/screens/humanPage/human.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        margin: EdgeInsets.only(bottom: 30.0),
        child: RaisedButton(
          onPressed: () {
            print("pressed");
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return Human();
                },
              ),
            );
          },
          child: Text(
            "Start!!!",
            style: TextStyle(color: Colors.white),
          ),
          color: Colors.pink[500],
        ),
      ),
    ),
    );
  }
}
