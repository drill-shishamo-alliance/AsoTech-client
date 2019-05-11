import 'dart:convert';
import 'dart:async';

import 'package:asotech_client/repositories/body/body.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

import 'package:asotech_client/models/models.dart';

class AsotechApiClient {
  //TODO:mock Api url
  static const baseUrl = 'http://private-9bdd2-tozastation.apiary-mock.com';
  final http.Client httpClient;

  AsotechApiClient({@required this.httpClient}) : assert(httpClient != null);

  //Are All Member Ready
  Future<User> getUser() async {
    final readyUrl = '$baseUrl/users';
    final readyResponse = await this.httpClient.get(readyUrl);
    if (readyResponse.statusCode != 200) {
      throw Exception('error getting Room status');
    }

    final readyJson = jsonDecode(readyResponse.body) as List;
    return readyJson.first;
  }


  //Room / Create The Room
  Future<List<CreateRoomBody>> createRoom(String userid, num time) async {
    final createRoomUrl = '$baseUrl/rooms/';
    final createRoomResponse = await this
        .httpClient
        .post(createRoomUrl, body: {"user_id": userid, "restrict_time": time});
    if (createRoomResponse.statusCode != 200) {
      throw Exception('error posting create room');
    }
    final createRoomJson = jsonDecode(createRoomResponse.body) as List;
    return createRoomJson.first;
  }

  //Are All Member Ready
  Future<bool> getReady(String userid) async {
    final readyUrl = '$baseUrl/rooms/$userid/checkin/status';
    final readyResponse = await this.httpClient.get(readyUrl);
    if (readyResponse.statusCode != 200) {
      throw Exception('error getting Room status');
    }

    final readyJson = jsonDecode(readyResponse.body) as List;
    return readyJson.first[0];
  }

  //Room Checkin / Belong To The Room
  Future<User> getJoinRoom(num userid) async {
    final joinroomUrl = '$baseUrl/rooms/';
    final joinRoomResponse = await this.httpClient.post(joinroomUrl, body: {
      "user_id": userid,
    });
    if (joinRoomResponse.statusCode != 200) {
      throw Exception('error posting create room');
    }
    final joinRoomJson = jsonDecode(joinRoomResponse.body) as List;
    return joinRoomJson.first;
  }

  //Room Remaining Status / List All Remaining Human
  Future<int> getRemainingStatus(num userid) async {
    final remainingstatusUrl = '$baseUrl/rooms/$userid/remaining/human';
    final remainingstatusResponse =
        await this.httpClient.get(remainingstatusUrl);
    if (remainingstatusResponse.statusCode != 200) {
      throw Exception('error getting locationId for city');
    }

    final readyJson = jsonDecode(remainingstatusResponse.body) as List;
    return readyJson.first[0];
  }

  //Room Human Location
  Future<List> getHumanLocation(num userid) async {
    final humanlocationUrl = '$baseUrl/rooms/$userid/humans/locations';
    final humanlocationResponse = await this.httpClient.get(humanlocationUrl);
    if (humanlocationResponse.statusCode != 200) {
      throw Exception('error getting locationId for city');
    }

    final readyJson = jsonDecode(humanlocationResponse.body) as List;
    return readyJson;
  }

  //Room Demon Location
  Future<List> getDemonLocation(num userid) async {
    final demonLocationUrl = '$baseUrl/rooms/$userid/demoms/locations';
    final demonLocationResponse = await this.httpClient.get(demonLocationUrl);
    if (demonLocationResponse.statusCode != 200) {
      throw Exception('error getting locationId for city');
    }

    final readyJson = jsonDecode(demonLocationResponse.body) as List;
    return readyJson.first;
  }
}