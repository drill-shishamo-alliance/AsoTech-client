import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        children: <Widget>[
          Image.asset(
            "assets/twitter.png",
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
            // height: MediaQuery.of(context).size.height,
          ),
          Align(
            alignment: Alignment(0.0, 1.0),
            child: Container(
              margin: EdgeInsets.only(bottom: 30.0),
              child: RaisedButton(
                onPressed: () {
                  print("pressed");
                },
                child: Text(
                  "YES YES YES",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.pink[500],
              ),
            ),
          ),
        ],
      ),
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
