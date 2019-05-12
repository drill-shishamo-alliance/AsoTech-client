import 'package:asotech_client/repositories/api.dart';
import 'package:asotech_client/screens/demonPage/demon.dart';
import 'package:flutter/material.dart';
import 'package:asotech_client/repositories/asotech_repository.dart';
import 'package:asotech_client/repositories/kvs_repository.dart';
import 'package:http/http.dart' as http;

class DemonWidget extends StatefulWidget {
  @override
  _DemonWidgetState createState() => _DemonWidgetState();
}

class _DemonWidgetState extends State<DemonWidget> {
  AsotechRepository _asotechRepository;
  KVSRepository _kvsRepository;

  bool status;

  void initialize(String userId) async {
    final roomId = await _asotechRepository.createTheRoom(userId);
    await _kvsRepository.setRoomId(roomId.value);
    while(true) {
      final result = await _asotechRepository.isAllMemberReady(roomId.value);
      if(result == true) {
        setState(() {
          status = true;
        });
        break;
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    status = false;
    _asotechRepository = AsotechRepository(asotechApiClient: AsotechApiClient(httpClient: http.Client()));
    _kvsRepository = KVSRepository();
    final userId =  new DateTime.now().millisecondsSinceEpoch;
    initialize(userId.toString());

  }

  @override
  Widget build(BuildContext context) {
    if(status==false) {
      return new Center(
        child: new CircularProgressIndicator(),
      );
    }else{
      Demon();
    }
  }
}
