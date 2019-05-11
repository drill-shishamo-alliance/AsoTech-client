import 'dart:async';

import 'package:asotech_client/models/models.dart';
import 'package:asotech_client/repositories/body/body.dart';
import 'package:meta/meta.dart';
import 'package:asotech_client/repositories/api.dart';


class AsotechRepository {
  final AsotechApiClient asotechApiClient;

  AsotechRepository({@required this.asotechApiClient}): assert(asotechApiClient != null);

  Future<User> getUser() async {
    final  isroomstate = await asotechApiClient.getUser();
    return isroomstate;
  }

  Future<List<CreateRoomBody>> createRoom(String userid, num time) async {
    final List<CreateRoomBody> isroomstate = await asotechApiClient.createRoom(userid, time);
    return isroomstate;
  }

  Future<bool> getReady(String roomid) async {
    final bool isroomstate = await asotechApiClient.getReady(roomid);
    return isroomstate;
  }

  Future<int> getRemainingStatus(num userid) async {
    final int remainingstatus =
        await asotechApiClient.getRemainingStatus(userid);
    return remainingstatus;
  }

  Future<List> getHumanLocation(num userid) async {
    final List humanlocation = await asotechApiClient.getHumanLocation(userid);
    return humanlocation;
  }

  Future<List> getDemonLocation(num userid) async {
    final List demonlocation = await asotechApiClient.getDemonLocation(userid);
    return demonlocation;
  }
}

