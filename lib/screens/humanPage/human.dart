import 'package:asotech_client/screens/mapPage/maps.dart';
import 'package:flutter/material.dart';
import 'package:asotech_client/screens/humanPage/widgets/widgets.dart';

class Human extends StatefulWidget {
  @override
  _HumanState createState() => _HumanState();
}

class _HumanState extends State<Human> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AsoTech"),
      ),
      body: Stack(
        children: <Widget>[
          Maps(),
          Timer(),
          Cooperation(),
        ],
      ),
      floatingActionButton: Column(
        verticalDirection: VerticalDirection.up, // childrenの先頭を下に配置
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          FloatingActionButton(
            heroTag: "1",
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
              heroTag: "2",
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
              heroTag: "3",
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