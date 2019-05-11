import 'package:asotech_client/screens/demonWidgetPage/demon_widget.dart';
import 'package:asotech_client/screens/humanWidgetPage/human_widget.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 30.0),
              child: RaisedButton(
                onPressed: () {
                  print("pressed police");
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return DemonWidget();
                      },
                    ),
                  );
                },
                child: Text(
                  "警察",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.pink[500],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 30.0),
              child: RaisedButton(
                onPressed: () {
                  print("pressed thief");
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return HumanWidget();
                      },
                    ),
                  );
                },
                child: Text(
                  "泥棒",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.pink[500],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
