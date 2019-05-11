import 'package:asotech_client/screens/humanPage/human.dart';
import 'package:flutter/material.dart';
import 'package:asotech_client/repositories/asotech_repository.dart';
import 'package:asotech_client/repositories/kvs_repository.dart';

class CreateRoom extends StatefulWidget {
  _CreateRoomState createState() => _CreateRoomState();
}

class _CreateRoomState extends State<CreateRoom> {
//  AsotechRepository _asotechRepository = AsotechRepository();
//  KVSRepository _kvsRepository = KVSRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.only(bottom: 30.0),
          child: RaisedButton(
            onPressed: () async {
//              final userId = "";
//              await _kvsRepository.setUserId(userId);
//              await _asotechRepository.createTheRoom(userId);
//              while (true) {
//                print("polling")
//                final result = await _asotechRepository.isAllMemberReady(roomId);
//                if (result) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Human();
                      },
                    ),
                  );
//                  break;
//                }
//              }
            },
            child: Text(
              "部屋を作る",
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.pink[500],
          ),
        ),
      ),
    );
  }
}
