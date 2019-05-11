import 'dart:async';

import 'package:meta/meta.dart';

import 'package:asotech_client/repositories/api.dart';
import 'package:asotech_client/models/models.dart';

class AsotechRepository {
  final AsotechApiClient asotechApiClient;

  AsotechRepository({@required this.asotechApiClient})
      : assert(asotechApiClient != null);


  Future<bool> getReady(userid) async {
    final bool isroomstate = await asotechApiClient.getReady(userid);
    return isroomstate;
  }

  Future<int> getRemainingStatus(userid) async {
    final int remainingstatus =
        await asotechApiClient.getRemainingStatus(userid);
    return remainingstatus;
  }

  Future<List> getHumanLocation(userid) async {
    final List humanlocation = await asotechApiClient.getHumanLocation(userid);
    return humanlocation;
  }

  Future<List> getDemonLocation(userid) async {
    final List demonlocation = await asotechApiClient.getDemonLocation(userid);
    return demonlocation;
  }
}
