import 'package:flutter/material.dart';

class Buttons extends StatefulWidget {
  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Buttons> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        verticalDirection: VerticalDirection.up, // childrenの先頭を下に配置
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          FloatingActionButton(
            // backgroundColor: Colors.redAccent[100],
            backgroundColor: Colors.grey[350],
            onPressed: () {
              print("pressed");
            },
          ),
          Container(
            // 余白のためContainerでラップ
            margin: EdgeInsets.only(bottom: 16.0),

            child: FloatingActionButton(
              heroTag: null,
              backgroundColor: Colors.amberAccent,
              onPressed: () {
                print("pressed");
              },
            ),
          ),
          Container(
            // 余白のためContainerでラップ
            margin: EdgeInsets.only(bottom: 16.0),
            child: FloatingActionButton(
              backgroundColor: Colors.amberAccent,
              onPressed: () {
                print("pressed");
              },
            ),
          ),
        ],
      ),
    );
  }
}
